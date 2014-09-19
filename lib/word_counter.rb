require 'keyword_checker'

class WordCounter

  def self.count_times_word_occurs_in_leads(word)
    leads = Lead.all
    count = 0
    leads.each do |lead|
      if KeywordChecker.word_in_tweet?(lead.tweet_body, word)
        count = count + 1
        puts lead.tweet_body
      end
    end
    puts "Total in leads tweet with the word are: #{count}"
    return count
  end

  def self.count_times_word_occurs_in_non_city_leads(word)
    leads = NonLeadTweetInCity.all
    count = 0
    leads.each do |lead|
      if KeywordChecker.word_in_tweet?(lead.tweet_body, word)
        count = count + 1
        puts lead.tweet_body
      end
    end
    puts "Total in NonLeadTweetInCity tweet with the word are: #{count}"
    return count
  end

  def self.count_times_word_occurs_in_non_leads(word)
    leads = TrainingNonLead.all
    count = 0
    leads.each do |lead|
      if KeywordChecker.word_in_tweet?(lead.tweet_body, word)
        count = count + 1
        puts lead.tweet_body
      end
    end
    puts "Total in Non Leads Training data tweet with the word are: #{count}"
    return count
  end



end