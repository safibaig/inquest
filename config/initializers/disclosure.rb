Disclosure.configure do |config|
  config.notifier_classes = []
  config.mail_sender = "please-change-me@localhost"
end

Disclosure::EmailReactor.class_eval do
  include Rails.application.routes.url_helpers

  def self.reaction_description
    "send me an email"
  end
end

PublicActivity::Activity.send(:include, Inquest::DisclosureActivity)