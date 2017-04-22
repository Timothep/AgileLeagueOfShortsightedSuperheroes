require 'squib'
require 'pp'

#Squib::logger.level = Logger::DEBUG

data = Squib.xlsx file: 'heroes.xlsx'

#def plusify(inputArray)
#  return  inputArray.map{|num| num == nil || (not(num.is_a? Integer)) || num == 0 ? num : num < 0 ? num.to_s.insert(1, ' ') : '+ ' + num.to_s}
#end

#def CompleteSVGPath(inputArray)
#  return  inputArray.map{|svg| svg == nil ? nil : 'svg\\' + svg}
#end

####################################
############ CARDS DECK ############
####################################

Squib::Deck.new cards: data['Name'].size, layout: 'heroes.yml' do
  background color: 'white'

  # Background
  svg layout: 'Background', file: data['Background']

  #text_underlay
  svg layout: 'Background', file: 'svg/text_underlay.svg'

  # Text
  text str: data['Plus'], layout: 'Plus'
  text str: data['Minus'], layout: 'Minus'

  # Title
  text str: data['Name'], layout:'Name'

  #rect layout: 'safe' # safe zone as defined by TheGameCrafter
  #rect layout: 'cut' # cut line as defined by TheGameCrafter

  #text str: Time.now, layout: 'credits'
  save_png prefix: 'card_'
  save_pdf trim: 37.5, file: 'cards.pdf'
end
