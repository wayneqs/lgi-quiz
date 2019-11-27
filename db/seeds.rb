now = Time.now
File.open("db/usernames.txt") { |f|
    moniker_data = f.readlines.shuffle.map {|name| { name: name.strip, created_at: now, updated_at: now } }
    Moniker.insert_all(moniker_data)   
}

# load the questions
require_relative 'the_questions'
TheQuestions.new.questions.each { |question| Question.create(question) }