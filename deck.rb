require 'squib'
require 'pp'

#Squib::logger.level = Logger::DEBUG

data = Squib.xlsx file: 'heroes.xlsx'

####################################
############ CARDS DECK ############
####################################

Squib::Deck.new cards: data['Name'].size, layout: 'heroes.yml' do
  background color: 'white'

  # Background
  svg layout: 'Background_cut', file: data['Background']

  #text_underlay
  svg layout: 'Background', file: 'svg/text_underlay.svg'

  # but
  text str: 'but...', layout: 'but_text'

  # Text
  text str: data['Plus'], layout: 'Plus'
  text str: data['Minus'], layout: 'Minus'

  # Title
  text str: data['Name'], layout:'Name'

  svg layout: 'Background', file: 'svg/border.svg'

  #rect layout: 'safe' # safe zone as defined by TheGameCrafter
  rect layout: 'cut' # cut line as defined by TheGameCrafter

  text str: "Tim Bourguignon CC BY-NC-SA 4.0", layout: 'credits'
  save_png prefix: 'card_'
  save_pdf trim: 37.5, file: 'cards.pdf'
end
