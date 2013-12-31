require 'logger'


class DqxMonsterDistributionMap::Logger < Logger

  def initialize(output=STDOUT, level:Logger::INFO, option:{})
    super(output,option)
    self.level = level
  end

end
