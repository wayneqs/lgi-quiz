now = Time.now
File.open("db/usernames.txt") { |f|
    moniker_data = f.readlines.shuffle.map {|name| { name: name.strip, created_at: now, updated_at: now } }
    Moniker.insert_all(moniker_data)   
}

# load the admin user
User.create(name: "XYZ@987", is_admin: true)

def extract_option_data(line)
    (prompt, score) = line.split("|")
    return {
        prompt: prompt,
        score: score ||= 1
    }
end

line_count = 1
question = {}
IO.foreach("db/questions.txt") { |line|
    unless line.strip.empty?
        if line_count == 1
            question = {}
            question[:prompt] = line
            question[:question_options_attributes] = []
        else
            option = extract_option_data(line)
            question[:question_options_attributes] << option
        end

        if line_count == 5
            line_count = 0
            Question.create(question)
        end

        line_count += 1
    end
}