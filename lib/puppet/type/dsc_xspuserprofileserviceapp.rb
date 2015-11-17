require 'pathname'

Puppet::Type.newtype(:dsc_xspuserprofileserviceapp) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xSPUserProfileServiceApp resource type.
    Automatically generated from
    'xSharePoint/Modules/xSharePoint/DSCResources/MSFT_xSPUserProfileServiceApp/MSFT_xSPUserProfileServiceApp.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_name is a required attribute') if self[:dsc_name].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    desc "A read-only value that is the DSC Resource Friendly Name ('xSPUserProfileServiceApp')."

    validate do |value|
      fail 'dscmeta_resource_friendly_name is read-only' if value != 'xSPUserProfileServiceApp'
    end

    defaultto 'xSPUserProfileServiceApp'
  end

  newparam(:dscmeta_resource_name) do
    desc "A read-only value that is the DSC Resource Name ('MSFT_xSPUserProfileServiceApp')."

    validate do |value|
      fail 'dscmeta_resource_name is read-only' if value != 'MSFT_xSPUserProfileServiceApp'
    end

    defaultto 'MSFT_xSPUserProfileServiceApp'
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
    desc "A read-only value that is the DSC Module Name ('xSharePoint')."

    validate do |value|
      fail 'dscmeta_module_name is read-only' if value != 'xSharePoint'
    end

    defaultto 'xSharePoint'
  end

  newparam(:dscmeta_module_version) do
    desc "A read-only value for the DSC Module Version ('0.7.0.0').
      This is the supported version of the PowerShell module that this
      type was built on. When Puppet runs this resource, it will explicitly
      use this version."

    validate do |value|
      fail 'dscmeta_module_version is read-only' if value != '0.7.0.0'
    end

    defaultto '0.7.0.0'
  end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    defaultto { :present }
  end

  # Name:         Name
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_name) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Name"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ApplicationPool
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_applicationpool) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ApplicationPool"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         FarmAccount
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_farmaccount) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "FarmAccount"
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("FarmAccount", value)
    end
  end

  # Name:         InstallAccount
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_installaccount) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "InstallAccount"
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("InstallAccount", value)
    end
  end

  # Name:         MySiteHostLocation
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_mysitehostlocation) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "MySiteHostLocation"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ProfileDBName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_profiledbname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ProfileDBName"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ProfileDBServer
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_profiledbserver) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ProfileDBServer"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SocialDBName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_socialdbname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SocialDBName"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SocialDBServer
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_socialdbserver) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SocialDBServer"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SyncDBName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_syncdbname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SyncDBName"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SyncDBServer
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_syncdbserver) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SyncDBServer"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end


end

Puppet::Type.type(:dsc_xspuserprofileserviceapp).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
