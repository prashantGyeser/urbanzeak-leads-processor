require 'keyword_checker'

class WordCounterProcessedTweets

  def self.count_times_word_occurs_in_leads(word)
    count = 0
    Lead.find_each do |lead|
      if KeywordChecker.word_in_tweet?(lead.tweet_body, word)
        count = count + 1
        WordCounter.create(word: word, tweet_body: lead.tweet_body, tweet_type: "lead")
      end
    end
    puts "Total in leads tweet with the word are: #{count}"
    return count
  end

  def self.count_times_word_occurs_in_non_city_leads(word)
    count = 0
    NonLeadTweetInCity.find_each do |unchecked_non_lead|
      if KeywordChecker.word_in_tweet?(unchecked_non_lead.tweet_body, word)
        count = count + 1
        WordCounter.create(word: word, tweet_body: unchecked_non_lead.tweet_body, tweet_type: "unchecked_non_lead")
      end
    end
    puts "Total in NonLeadTweetInCity tweet with the word are: #{count}"
    return count
  end

  def self.count_times_word_occurs_in_non_leads(word)

    count = 0
    TrainingNonLead.find_each do |non_lead|
      if KeywordChecker.word_in_tweet?(non_lead.tweet_body, word)
        count = count + 1
        WordCounter.create(word: word, tweet_body: non_lead.tweet_body, tweet_type: "non_lead")
      end
    end
    puts "Total in Non Leads Training data tweet with the word are: #{count}"
    return count
  end


end