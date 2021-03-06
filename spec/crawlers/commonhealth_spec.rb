require 'rails_helper'
require 'classes/crawler'
require 'classes/crawler/commonhealth'

describe "commonhealth_crawler" do

  before(:all){ 
    @hosp = Hospital.create(coUrl: "http://www.commonhealth.com.tw/medical/hospitalInfo.action?nid=394&divisionType=")
    @c = Crawler::Commonhealth.new
    @c.fetch @hosp.coUrl
    @c.crawl_detail @hosp
  }

  it "crawel url" do
    index_url = "http://www.commonhealth.com.tw/medical/findHospital.action?&policlinic=0&page=2"
    c = Crawler::Commonhealth.new
    c.fetch index_url
    c.crawl_co_urls

    hospital = Hospital.first

    expect(hospital).not_to be nil
    expect(hospital.coUrl).not_to be nil
  end

  it "crawl garde" do
    expect(@hosp.grade).to eq("衛生福利部　醫院評鑑【【優等】】（醫學中心）評鑑合格效期：2013/1/1-2016/12/31")
  end

  it "crawl cHours" do
    expect(@hosp.cHours).not_to be(nil)
  end

end