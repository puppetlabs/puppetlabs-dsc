require 'pathname'

Puppet::Type.newtype(:dsc_xdnsserveradzone) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xDnsServerADZone resource type.
    Automatically generated from
    'xDnsServer/DSCResources/MSFT_xDnsServerADZone/MSFT_xDnsServerADZone.schema.mof'

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

  def dscmeta_resource_friendly_name; 'xDnsServerADZone' end
  def dscmeta_resource_name; 'MSFT_xDnsServerADZone' end
  def dscmeta_module_name; 'xDnsServer' end
  def dscmeta_module_version; '1.6.0.0' end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    newvalue(:absent)  { provider.destroy }
    defaultto { :present }
  end

  # Name:         Name
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_name) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Name - DNS Server zone name"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         DynamicUpdate
  # Type:         string
  # IsMandatory:  False
  # Values:       ["None", "NonsecureAndSecure", "Secure"]
  newparam(:dsc_dynamicupdate) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DynamicUpdate - Dynamic zone update option Valid values are None, NonsecureAndSecure, Secure."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['None', 'none', 'NonsecureAndSecure', 'nonsecureandsecure', 'Secure', 'secure'].include?(value)
        fail("Invalid value '#{value}'. Valid values are None, NonsecureAndSecure, Secure")
      end
    end
  end

  # Name:         ReplicationScope
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Custom", "Domain", "Forest", "Legacy"]
  newparam(:dsc_replicationscope) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ReplicationScope - Replication scope option Valid values are Custom, Domain, Forest, Legacy."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Custom', 'custom', 'Domain', 'domain', 'Forest', 'forest', 'Legacy', 'legacy'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Custom, Domain, Forest, Legacy")
      end
    end
  end

  # Name:         DirectoryPartitionName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_directorypartitionname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DirectoryPartitionName - Directory partition name"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ComputerName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_computername) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ComputerName - DNS Server name"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Credential
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_credential) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "Credential - Credential used to set zone"
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("Credential", value)
    end
  end

  # Name:         Ensure
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Present", "Absent"]
  newparam(:dsc_ensure) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Ensure - Whether the DNS zone should be available or removed Valid values are Present, Absent."
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


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_xdnsserveradzone).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
