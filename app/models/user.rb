class User < ActiveRecord::Base
  def self.from_omniauth(auth, runner)
    find_by_provider_and_uid(auth["provider"], auth["uid"]) || create_with_omniauth(auth, runner)
  end

  def self.create_with_omniauth(auth, runner)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.isRunner = runner || false
    end
  end

  has_many :races
end
