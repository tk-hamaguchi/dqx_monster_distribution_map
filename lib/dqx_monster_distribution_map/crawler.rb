require 'hpricot'
require 'open-uri'


class DqxMonsterDistributionMap::Crawler
  DEFAULT_URL="http://www.d-quest-10.com"
  class << self
    def execute(args)
      logger.debug "Execute crawl to #{args.join(',')}."
      args.each_with_object({}) do |name,result|
        logger.debug "Processing #{name}..."
        uri = URI.escape "#{DEFAULT_URL}/se/result.php?key=#{name}&se=1"
        doc = Hpricot( open(uri).read )
        if (link = doc.search('div#MAIN a')
                 .select { |elem| elem[:href] =~ /detail/ }).empty?
          logger.warn 'Link not found!'
          logger.debug doc.search('div#MAIN a')
          next
        end
        path = link.first[:href]
        uri2 = "#{DEFAULT_URL}#{path}"
        doc = Hpricot( open(uri2).read )
        area = doc.search("div.T2 tr[9]").search('td').last.inner_text
        logger.debug area
        area.split('、').each do |obj|
          matched = obj.split(/[（）]/)
          result[matched[0]] ||= []
          result[matched[0]] << (matched[1] ? "#{name} (#{matched[1]})" : name)
        end
      end
    end

    def logger=(logger)
      @logger = logger
    end

    def logger(output=(RUBY_PLATFORM =~ /mswin|mingw/ ? 'NUL:' : '/dev/null'), level:Logger::DEBUG, option:{})
      @logger ||= begin
                    logger = Logger.new(output,option)
                    logger.level = level
                    logger
                  end
    end
  end
end
