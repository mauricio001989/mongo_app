namespace :data_migration do
  desc "Add timestamps to existing User documents"
  task add_timestamps_to_users: :environment do
    puts "[#{Time.current}] Starting migration: Adding timestamps to Users"
    
    batch_size = 500
    total_users = User.where(created_at: nil).count
    processed = 0
    
    # Usamos batch processing sin no_timeout
    User.where(created_at: nil).each_slice(batch_size) do |batch|
      batch.each do |user|
        user.set(
          created_at: user._id.generation_time || Time.current, # Usamos la fecha del ObjectId si es posible
          updated_at: Time.current
        )
      end
      processed += batch.size
      puts "[#{Time.current}] Processed #{processed}/#{total_users} users"
      sleep 0.5 # Pequeña pausa para evitar timeouts en Atlas Free Tier
    end
    
    puts "[#{Time.current}] Completed! Processed #{processed} users"
  rescue => e
    puts "[#{Time.current}] Error: #{e.message}"
    puts "Retrying failed documents..." if e.message.include?('timeout')
    retry if e.message.include?('timeout') && processed < total_users
    raise e unless e.message.include?('timeout')
  end
end
