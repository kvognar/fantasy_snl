namespace :actor do
  task :assign_images => :environment do
    Actor.all.each do |actor|
      actor.update_attributes(image_url: "#{actor.name.downcase}.jpg")
    end
  end
end
