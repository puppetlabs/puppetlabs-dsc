require 'pathname'

Puppet::Type.newtype(:dsc_xmysqlgrant) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xMySqlGrant resource type.
    Automatically generated from
    'xMySql/DscResources/MSFT_xMySqlGrant/MSFT_xMySqlGrant.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_username is a required attribute') if self[:dsc_username].nil?
      fail('dsc_databasename is a required attribute') if self[:dsc_databasename].nil?
    end

  newproperty(:dscmeta_resource_friendly_name) do
    desc "A read-only value that is the DSC Resource Friendly Name ('xMySqlGrant')."

    def retrieve
      'xMySqlGrant'
    end

    validate do |value|
      fail 'dscmeta_resource_friendly_name is read-only'
    end
  end

  newproperty(:dscmeta_resource_name) do
    desc "A read-only value that is the DSC Resource Name ('MSFT_xMySqlGrant')."

    def retrieve
      'MSFT_xMySqlGrant'
    end

    validate do |value|
      fail 'dscmeta_resource_name is read-only'
    end
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

  newproperty(:dscmeta_module_name) do
    desc "A read-only value that is the DSC Module Name ('xMySql')."

    def retrieve
      'xMySql'
    end

    validate do |value|
      fail 'dscmeta_module_name is read-only'
    end
  end

  newproperty(:dscmeta_module_version) do
    desc "A read-only value for the DSC Module Version ('1.1.0.0').
      This is the supported version of the PowerShell module that this
      type was built on. When Puppet runs this resource, it will explicitly
      use this version."

    def retrieve
      '1.1.0.0'
    end

    validate do |value|
      fail 'dscmeta_module_version is read-only'
    end
  end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    newvalue(:absent)  { provider.destroy }
    defaultto { :present }
  end

  # Name:         UserName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_username) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "UserName - Name of MySQL user."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         DatabaseName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_databasename) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DatabaseName - MySql database name to grant permissions."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ConnectionCredential
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_connectioncredential) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "ConnectionCredential - MySql connection credential used for the root."
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("ConnectionCredential", value)
    end
  end

  # Name:         PermissionType
  # Type:         string
  # IsMandatory:  False
  # Values:       ["ALL PRIVILEGES", "CREATE", "DROP", "DELETE", "INSERT", "SELECT", "UPDATE", "EXECUTE"]
  newparam(:dsc_permissiontype) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "PermissionType - MySql user permission type. Valid values are ALL PRIVILEGES, CREATE, DROP, DELETE, INSERT, SELECT, UPDATE, EXECUTE."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['ALL PRIVILEGES', 'all privileges', 'CREATE', 'create', 'DROP', 'drop', 'DELETE', 'delete', 'INSERT', 'insert', 'SELECT', 'select', 'UPDATE', 'update', 'EXECUTE', 'execute'].include?(value)
        fail("Invalid value '#{value}'. Valid values are ALL PRIVILEGES, CREATE, DROP, DELETE, INSERT, SELECT, UPDATE, EXECUTE")
      end
    end
  end

  # Name:         Ensure
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Present", "Absent"]
  newparam(:dsc_ensure) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Ensure - Ensure given grant to mySql database present or absent. Valid values are Present, Absent."
    validate do |value|
      resource[:ensure] = value.downcase
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Present', 'present', 'Absent', 'absent'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Present, Absent")
      end
    end
  end


end

Puppet::Type.type(:dsc_xmysqlgrant).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
