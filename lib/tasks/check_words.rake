require 'word_counter_processed_tweets'

# Usage sample
# rake check:word[<word to check. Takes only one word>]

namespace :check do
  desc "Check if a list of words exists in the leads and non leads"
  task :word, [:word] => :environment do |task, args|
    word_to_check = args.word.to_s.downcase

    word_counters = WordCounter.where(word: word_to_check)
    word_counters.destroy_all

    #Lead.records_containing_word(args.word.to_s)
    WordCounterProcessedTweets.count_times_word_occurs_in_leads(word_to_check)
    WordCounterProcessedTweets.count_times_word_occurs_in_non_city_leads(word_to_check)
    WordCounterProcessedTweets.count_times_word_occurs_in_non_leads(word_to_check)
    puts "Finished storing tweets with the word"
  end

  desc "Get the word count for all the words in the tweet body in the leads table"
  task lead_word_count: :environment do
    words = WordCounterProcessedTweets.unique_word_count_in_leads
    Hash[words.sort_by{|k, v| v}.reverse].each do |word|
      puts word.inspect
    end
  end

  desc "Get the word count for all the words in the tweet body in the unchecked non leads table"
  task unchecked_non_lead_word_count: :environment do
    words = WordCounterProcessedTweets.unique_word_count_in_unchecked_non_leads
    Hash[words.sort_by{|k, v| v}.reverse].each do |word|
      puts word.inspect
    end
  end

  desc "Get the word count for all the words in the tweet body in the non leads table"
  task non_lead_word_count: :environment do
    words = WordCounterProcessedTweets.unique_word_count_in_non_leads
    Hash[words.sort_by{|k, v| v}.reverse].each do |word|
      puts word.inspect
    end
  end

end
