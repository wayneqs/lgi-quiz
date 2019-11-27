now = Time.now
File.open("db/usernames.txt") { |f|
    moniker_data = f.readlines.shuffle.map {|name| { name: name.strip, created_at: now, updated_at: now } }
    Moniker.insert_all(moniker_data)   
}