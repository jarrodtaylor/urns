class Zone < Sequel::Model
  plugin :timestamps

  one_to_many :states
end
