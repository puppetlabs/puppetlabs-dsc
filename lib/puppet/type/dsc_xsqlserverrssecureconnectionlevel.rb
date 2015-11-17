require 'pathname'

Puppet::Type.newtype(:dsc_xsqlserverrssecureconnectionlevel) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xSQLServerRSSecureConnectionLevel resource type.
    Automatically generated from
    'xSQLServer/DSCResources/MSFT_xSQLServerRSSecureConnectionLevel/MSFT_xSQLServerRSSecureConnectionLevel.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_instancename is a required attribute') if self[:dsc_instancename].nil?
      fail('dsc_secureconnectionlevel is a required attribute') if self[:dsc_secureconnectionlevel].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    desc "A read-only value that is the DSC Resource Friendly Name ('xSQLServerRSSecureConnectionLevel')."

    validate do |value|
      fail 'dscmeta_resource_friendly_name is read-only' if value != 'xSQLServerRSSecureConnectionLevel'
    end

    defaultto 'xSQLServerRSSecureConnectionLevel'
  end

  newparam(:dscmeta_resource_name) do
    desc "A read-only value that is the DSC Resource Name ('MSFT_xSQLServerRSSecureConnectionLevel')."

    validate do |value|
      fail 'dscmeta_resource_name is read-only' if value != 'MSFT_xSQLServerRSSecureConnectionLevel'
    end

    defaultto 'MSFT_xSQLServerRSSecureConnectionLevel'
  end

  newparam(:dscmeta_import_resource) do
    desc "Please ignore this parameter.
      Defaults to `true`."
    newvalues(true, false)

    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    desc "A read-only value that is the DSC Module Name ('xSQLServer')."

    validate do |value|
      fail 'dscmeta_module_name is read-only' if value != 'xSQLServer'
    end

    defaultto 'xSQLServer'
  end

  newparam(:dscmeta_module_version) do
    desc "A read-only value for the DSC Module Version ('1.3.0.0').
      This is the supported version of the PowerShell module that this
      type was built on. When Puppet runs this resource, it will explicitly
      use this version."

    validate do |value|
      fail 'dscmeta_module_version is read-only' if value != '1.3.0.0'
    end

    defaultto '1.3.0.0'
  end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    defaultto { :present }
  end

  # Name:         InstanceName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_instancename) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "InstanceName - SQL instance to set secure connection level for."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SecureConnectionLevel
  # Type:         uint16
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_secureconnectionlevel) do
    def mof_type; 'uint16' end
    def mof_is_embedded?; false end
    desc "SecureConnectionLevel - SQL Server Reporting Service secure connection level."
    isrequired
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         SQLAdminCredential
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sqladmincredential) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "SQLAdminCredential - Credential with administrative permissions to the SQL instance."
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("SQLAdminCredential", value)
    end
  end


end

Puppet::Type.type(:dsc_xsqlserverrssecureconnectionlevel).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
