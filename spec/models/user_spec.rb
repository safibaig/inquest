require 'spec_helper'

describe User do
  fixtures :users

  subject do
    users(:tester)
  end

  context "with valid attributes" do
    it { should be_valid }

    it "should create default notification rules" do
      subject.send(:create_default_notification_rules)
      subject.should have_at_least(2).notification_rules
    end
  end

  context "with missing attributes" do
    before do
      subject.password = ""
    end
    
    it { should_not be_valid }
  end

  it "should have questions" do
    expect {
      subject.questions << Question.new
    }.to change(subject.questions, :size).by(1)
  end

 
  it "should have answers" do
    expect {
      subject.answers << Answer.new
    }.to change(subject.answers, :size).by(1)
  end
end
