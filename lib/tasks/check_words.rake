require 'word_counter_processed_tweets'

# Usage sample
# rake check:word[<word to check. Takes only one word>]

namespace :check do
  desc "Check if a list of words exists in the leads and non leads"
  task :word, [:word] => :environment do |task, args|
    word_to_check = args.word.to_s

    word_counters = WordCounter.where(word: word_to_check)
    word_counters.destroy_all

    #Lead.records_containing_word(args.word.to_s)
    WordCounterProcessedTweets.count_times_word_occurs_in_leads(word_to_check)
    WordCounterProcessedTweets.count_times_word_occurs_in_non_city_leads(word_to_check)
    WordCounterProcessedTweets.count_times_word_occurs_in_non_leads(word_to_check)
    puts "Finished storing tweets with the word"
  end
end