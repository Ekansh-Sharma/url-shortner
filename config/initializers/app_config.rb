module AppConfig
  def self.load
    HashWithIndifferentAccess.new(YAML.load(ERB.new(File.read("#{Rails.root}/config/application_config.yml")).result))
  end
end
APP_CONFIG = AppConfig.load