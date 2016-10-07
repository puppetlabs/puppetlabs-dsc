#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_spwebappsiteuseanddeletion) do

  let :dsc_spwebappsiteuseanddeletion do
    Puppet::Type.type(:dsc_spwebappsiteuseanddeletion).new(
      :name     => 'foo',
      :dsc_url => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_spwebappsiteuseanddeletion).new(
      :name     => 'foo',
      :dsc_url => 'foo',
      :dsc_sendunusedsitecollectionnotifications => true,
      :dsc_unusedsitenotificationperiod => 32,
      :dsc_automaticallydeleteunusedsitecollections => true,
      :dsc_unusedsitenotificationsbeforedeletion => 32,
      :dsc_installaccount => {"user"=>"user", "password"=>"password"},
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_spwebappsiteuseanddeletion.to_s).to eq("Dsc_spwebappsiteuseanddeletion[foo]")
  end

  it 'should require that dsc_url is specified' do
    #dsc_spwebappsiteuseanddeletion[:dsc_url]
    expect { Puppet::Type.type(:dsc_spwebappsiteuseanddeletion).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_url is a required attribute/)
  end

  it 'should not accept array for dsc_url' do
    expect{dsc_spwebappsiteuseanddeletion[:dsc_url] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_url' do
    expect{dsc_spwebappsiteuseanddeletion[:dsc_url] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_url' do
    expect{dsc_spwebappsiteuseanddeletion[:dsc_url] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sendunusedsitecollectionnotifications' do
    expect{dsc_spwebappsiteuseanddeletion[:dsc_sendunusedsitecollectionnotifications] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_sendunusedsitecollectionnotifications" do
    dsc_spwebappsiteuseanddeletion[:dsc_sendunusedsitecollectionnotifications] = 'true'
    expect(dsc_spwebappsiteuseanddeletion[:dsc_sendunusedsitecollectionnotifications]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean('true'))
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_sendunusedsitecollectionnotifications" do
    dsc_spwebappsiteuseanddeletion[:dsc_sendunusedsitecollectionnotifications] = 'false'
    expect(dsc_spwebappsiteuseanddeletion[:dsc_sendunusedsitecollectionnotifications]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean('false'))
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_sendunusedsitecollectionnotifications" do
    dsc_spwebappsiteuseanddeletion[:dsc_sendunusedsitecollectionnotifications] = 'True'
    expect(dsc_spwebappsiteuseanddeletion[:dsc_sendunusedsitecollectionnotifications]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean('True'))
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_sendunusedsitecollectionnotifications" do
    dsc_spwebappsiteuseanddeletion[:dsc_sendunusedsitecollectionnotifications] = 'False'
    expect(dsc_spwebappsiteuseanddeletion[:dsc_sendunusedsitecollectionnotifications]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean('False'))
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_sendunusedsitecollectionnotifications" do
    dsc_spwebappsiteuseanddeletion[:dsc_sendunusedsitecollectionnotifications] = :true
    expect(dsc_spwebappsiteuseanddeletion[:dsc_sendunusedsitecollectionnotifications]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean(:true))
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_sendunusedsitecollectionnotifications" do
    dsc_spwebappsiteuseanddeletion[:dsc_sendunusedsitecollectionnotifications] = :false
    expect(dsc_spwebappsiteuseanddeletion[:dsc_sendunusedsitecollectionnotifications]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean(:false))
  end

  it 'should not accept int for dsc_sendunusedsitecollectionnotifications' do
    expect{dsc_spwebappsiteuseanddeletion[:dsc_sendunusedsitecollectionnotifications] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_unusedsitenotificationperiod' do
    expect{dsc_spwebappsiteuseanddeletion[:dsc_unusedsitenotificationperiod] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_unusedsitenotificationperiod' do
    expect{dsc_spwebappsiteuseanddeletion[:dsc_unusedsitenotificationperiod] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_automaticallydeleteunusedsitecollections' do
    expect{dsc_spwebappsiteuseanddeletion[:dsc_automaticallydeleteunusedsitecollections] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_automaticallydeleteunusedsitecollections" do
    dsc_spwebappsiteuseanddeletion[:dsc_automaticallydeleteunusedsitecollections] = 'true'
    expect(dsc_spwebappsiteuseanddeletion[:dsc_automaticallydeleteunusedsitecollections]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean('true'))
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_automaticallydeleteunusedsitecollections" do
    dsc_spwebappsiteuseanddeletion[:dsc_automaticallydeleteunusedsitecollections] = 'false'
    expect(dsc_spwebappsiteuseanddeletion[:dsc_automaticallydeleteunusedsitecollections]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean('false'))
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_automaticallydeleteunusedsitecollections" do
    dsc_spwebappsiteuseanddeletion[:dsc_automaticallydeleteunusedsitecollections] = 'True'
    expect(dsc_spwebappsiteuseanddeletion[:dsc_automaticallydeleteunusedsitecollections]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean('True'))
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_automaticallydeleteunusedsitecollections" do
    dsc_spwebappsiteuseanddeletion[:dsc_automaticallydeleteunusedsitecollections] = 'False'
    expect(dsc_spwebappsiteuseanddeletion[:dsc_automaticallydeleteunusedsitecollections]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean('False'))
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_automaticallydeleteunusedsitecollections" do
    dsc_spwebappsiteuseanddeletion[:dsc_automaticallydeleteunusedsitecollections] = :true
    expect(dsc_spwebappsiteuseanddeletion[:dsc_automaticallydeleteunusedsitecollections]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean(:true))
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_automaticallydeleteunusedsitecollections" do
    dsc_spwebappsiteuseanddeletion[:dsc_automaticallydeleteunusedsitecollections] = :false
    expect(dsc_spwebappsiteuseanddeletion[:dsc_automaticallydeleteunusedsitecollections]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean(:false))
  end

  it 'should not accept int for dsc_automaticallydeleteunusedsitecollections' do
    expect{dsc_spwebappsiteuseanddeletion[:dsc_automaticallydeleteunusedsitecollections] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_unusedsitenotificationsbeforedeletion' do
    expect{dsc_spwebappsiteuseanddeletion[:dsc_unusedsitenotificationsbeforedeletion] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_unusedsitenotificationsbeforedeletion' do
    expect{dsc_spwebappsiteuseanddeletion[:dsc_unusedsitenotificationsbeforedeletion] = true}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_installaccount" do
    expect{dsc_spwebappsiteuseanddeletion[:dsc_installaccount] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installaccount' do
    expect{dsc_spwebappsiteuseanddeletion[:dsc_installaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installaccount' do
    expect{dsc_spwebappsiteuseanddeletion[:dsc_installaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installaccount' do
    expect{dsc_spwebappsiteuseanddeletion[:dsc_installaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_spwebappsiteuseanddeletion)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_spwebappsiteuseanddeletion)
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

    describe "when dsc_resource has credentials" do

      it "should convert credential hash to a pscredential object" do
        expect(@provider.ps_script_content('test')).to match(/| new-pscredential'/)
      end

    end


  end
end
