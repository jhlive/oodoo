class CreateTwilioMessages < ActiveRecord::Migration
  def change
    create_table :twilio_messages do |t|
      t.string :message

      t.timestamps
    end
  end
end
