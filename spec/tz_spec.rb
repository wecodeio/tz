require_relative "spec_helper"
require_relative "../lib/tz"

module TZ
  describe TimeWithZone do
    let(:time_zone) { "Eastern Time (US & Canada)" }
    let(:utc_object) { Time.utc(2014, 6, 13, 12, 0, 0) }
    
    subject { TimeWithZone.new(utc_object, time_zone) }
    
    describe "when the input object is a UTC time" do
      it "formats the input time object" do
        subject.in_time_zone.must_equal "Fri, 13 Jun 2014 08:00:00 EDT -04:00"
      end
    end

    describe "when the input object is an instance of the Date class" do
      let(:utc_object) { Date.new(2014, 6, 13) }
      
      it "formats the input date object" do
        subject.in_time_zone.must_equal "Thu, 12 Jun 2014 20:00:00 EDT -04:00"
      end
    end

    describe "when the input object is a non-UTC time" do
      let(:utc_object) do
        utc_time = Time.utc(2014, 6, 13, 15, 0, 0)
        tz = TZInfo::Timezone.get("America/Argentina/Buenos_Aires")
        tz.local_to_utc(utc_time).tap do |time|
          def time.utc?
            false
          end
        end
      end
      
      it "formats the input time object" do
        subject.in_time_zone.must_equal "Fri, 13 Jun 2014 14:00:00 EDT -04:00"
      end
    end
    
    describe "#time_zone" do
      it "returns the tzinfo time zone object" do
        subject.time_zone.must_be_instance_of TZInfo::DataTimezone
      end
    end
  end
end
