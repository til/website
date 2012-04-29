# encoding: utf-8
require 'test_helper'

class UserEditObserverTest < ActiveSupport::TestCase
  setup { ActionMailer::Base.deliveries.clear }

  test "Send mail for new comment" do
    simple = FactoryGirl.create(:simple)
    ActionMailer::Base.deliveries.clear
    simple.comments.create(body: "ein test body")
    assert !ActionMailer::Base.deliveries.empty?
  end

  test "Send mail for updated comment" do
    comment = FactoryGirl.create(:single_event_comment)
    comment.body = "new body"
    comment.save
    assert !ActionMailer::Base.deliveries.empty?
  end

  test "Send mail for new event" do
    simple = FactoryGirl.create(:simple)
    assert !ActionMailer::Base.deliveries.empty?
  end

  test "Send mail for updated event" do
    event = FactoryGirl.create(:simple)
    ActionMailer::Base.deliveries.clear
    event.name = "new body"
    event.save
    assert !ActionMailer::Base.deliveries.empty?
  end

  test "Send mail for new single event" do
    single_event = FactoryGirl.create(:single_event)
    assert !ActionMailer::Base.deliveries.empty?
  end

  test "Send mail for updated single event" do
    single_event = FactoryGirl.create(:single_event)
    ActionMailer::Base.deliveries.clear
    single_event.topic = "new body"
    single_event.save
    assert !ActionMailer::Base.deliveries.empty?
  end

end
