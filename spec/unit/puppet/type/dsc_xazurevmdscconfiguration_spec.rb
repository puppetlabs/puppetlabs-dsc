#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xazurevmdscconfiguration) do

  let :dsc_xazurevmdscconfiguration do
    Puppet::Type.type(:dsc_xazurevmdscconfiguration).new(
      :name     => 'foo',
      :dsc_storageaccountname => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_xazurevmdscconfiguration).new(
      :name     => 'foo',
      :dsc_storageaccountname => 'foo',
      :dsc_ensure => 'Present',
      :dsc_containername => 'foo',
      :dsc_configurationpath => 'foo',
      :dsc_azuresubscriptionname => 'foo',
      :dsc_azurepublishsettingspath => 'foo',
      :dsc_bloburi => 'foo',
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_xazurevmdscconfiguration.to_s).to eq("Dsc_xazurevmdscconfiguration[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xazurevmdscconfiguration[:ensure]).to eq :present
  end

  it 'should require that dsc_storageaccountname is specified' do
    #dsc_xazurevmdscconfiguration[:dsc_storageaccountname]
    expect { Puppet::Type.type(:dsc_xazurevmdscconfiguration).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_storageaccountname is a required attribute/)
  end

  it 'should not accept array for dsc_storageaccountname' do
    expect{dsc_xazurevmdscconfiguration[:dsc_storageaccountname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_storageaccountname' do
    expect{dsc_xazurevmdscconfiguration[:dsc_storageaccountname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_storageaccountname' do
    expect{dsc_xazurevmdscconfiguration[:dsc_storageaccountname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xazurevmdscconfiguration[:dsc_ensure] = 'Present'
    expect(dsc_xazurevmdscconfiguration[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xazurevmdscconfiguration[:dsc_ensure] = 'present'
    expect(dsc_xazurevmdscconfiguration[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xazurevmdscconfiguration[:dsc_ensure] = 'present'
    expect(dsc_xazurevmdscconfiguration[:ensure]).to eq(dsc_xazurevmdscconfiguration[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xazurevmdscconfiguration[:dsc_ensure] = 'Absent'
    expect(dsc_xazurevmdscconfiguration[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xazurevmdscconfiguration[:dsc_ensure] = 'absent'
    expect(dsc_xazurevmdscconfiguration[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xazurevmdscconfiguration[:dsc_ensure] = 'absent'
    expect(dsc_xazurevmdscconfiguration[:ensure]).to eq(dsc_xazurevmdscconfiguration[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xazurevmdscconfiguration[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xazurevmdscconfiguration[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xazurevmdscconfiguration[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xazurevmdscconfiguration[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_containername' do
    expect{dsc_xazurevmdscconfiguration[:dsc_containername] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_containername' do
    expect{dsc_xazurevmdscconfiguration[:dsc_containername] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_containername' do
    expect{dsc_xazurevmdscconfiguration[:dsc_containername] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_configurationpath' do
    expect{dsc_xazurevmdscconfiguration[:dsc_configurationpath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_configurationpath' do
    expect{dsc_xazurevmdscconfiguration[:dsc_configurationpath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_configurationpath' do
    expect{dsc_xazurevmdscconfiguration[:dsc_configurationpath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_azuresubscriptionname' do
    expect{dsc_xazurevmdscconfiguration[:dsc_azuresubscriptionname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_azuresubscriptionname' do
    expect{dsc_xazurevmdscconfiguration[:dsc_azuresubscriptionname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_azuresubscriptionname' do
    expect{dsc_xazurevmdscconfiguration[:dsc_azuresubscriptionname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_azurepublishsettingspath' do
    expect{dsc_xazurevmdscconfiguration[:dsc_azurepublishsettingspath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_azurepublishsettingspath' do
    expect{dsc_xazurevmdscconfiguration[:dsc_azurepublishsettingspath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_azurepublishsettingspath' do
    expect{dsc_xazurevmdscconfiguration[:dsc_azurepublishsettingspath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_bloburi' do
    expect{dsc_xazurevmdscconfiguration[:dsc_bloburi] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_bloburi' do
    expect{dsc_xazurevmdscconfiguration[:dsc_bloburi] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_bloburi' do
    expect{dsc_xazurevmdscconfiguration[:dsc_bloburi] = -16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xazurevmdscconfiguration)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xazurevmdscconfiguration)
    end

    describe "when dscmeta_module_name existing/is defined " do

      it "should compute powershell dsc test script with Invoke-DscResource" do
        expect(@provider.ps_script_content('test')).to match(/Invoke-DscResource/)
      end

      it "should compute powershell dsc test script with method Test" do
        expect(@provider.ps_script_content('test')).to match(/Method\s+=\s*'test'/)
      end

      it "should compute powershell dsc set script with Invoke-DscResource" do
        expect(@provider.ps_script_content('set')).to match(/Invoke-DscResource/)
      end

      it "should compute powershell dsc test script with method Set" do
        expect(@provider.ps_script_content('set')).to match(/Method\s+=\s*'set'/)
      end

    end

    describe "when dsc_ensure is 'present'" do

      before(:each) do
        dsc_xazurevmdscconfiguration.original_parameters[:dsc_ensure] = 'present'
        dsc_xazurevmdscconfiguration[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_xazurevmdscconfiguration)
      end

      it "should update :ensure to :present" do
        expect(dsc_xazurevmdscconfiguration[:ensure]).to eq(:present)
      end

      it "should compute powershell dsc test script in which ensure value is 'present'" do
        expect(@provider.ps_script_content('test')).to match(/ensure = 'present'/)
      end

      it "should compute powershell dsc set script in which ensure value is 'present'" do
        expect(@provider.ps_script_content('set')).to match(/ensure = 'present'/)
      end

    end

    describe "when dsc_ensure is 'absent'" do

      before(:each) do
        dsc_xazurevmdscconfiguration.original_parameters[:dsc_ensure] = 'absent'
        dsc_xazurevmdscconfiguration[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_xazurevmdscconfiguration)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xazurevmdscconfiguration[:ensure]).to eq(:absent)
      end

      it "should compute powershell dsc test script in which ensure value is 'present'" do
        expect(@provider.ps_script_content('test')).to match(/ensure = 'present'/)
      end

      it "should compute powershell dsc set script in which ensure value is 'absent'" do
        expect(@provider.ps_script_content('set')).to match(/ensure = 'absent'/)
      end

    end

  end
end
