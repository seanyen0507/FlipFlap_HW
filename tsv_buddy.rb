# Module that can be included (mixin) to create and parse TSV data
 module TsvBuddy
  # @data should be a data structure that stores information
  #  from TSV or Yaml files. For example, it could be an Array of Hashes.
  attr_accessor :data

  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
      head, @data , content ,contents = [], [] , [], []
      content = tsv.split("\n")
      head = content[0].gsub("\n", '').split("\t")
      content.delete_at(0)
      for i in 0..content.size-1
        contents << content[i].gsub("\n", '').split("\t")
      end
      
    0.upto(contents.size - 1) { |i| @data << Hash[head.zip contents[i]] }
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    information = ""
    @data[1].each {|key,value| key=="tech_experience" ? information += "#{key}\n" : information += "#{key}\t" }
    @data.each {|hash| hash.each {|key,value| key=="tech_experience" ? information += "#{value}\n" : information += "#{value}\t" }}
    information
  end
end
