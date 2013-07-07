#BlackJack = 21, pays 1.5times if natural and dealer doesnt have at open
#Ace = 1 or 11
#Dealer hits if the value is less than 17, otherwise must stand.
#Two cards face up to player, one face up for dealer till player done.
#Hash for cards name to number value ???
def total(cards)
  arr = cards.map{|e| e[1] }

  total = 0
  arr.each do |value|
    if value == "Ace"
      total += 11
    elsif value.to_i == 0 # J, Q, K
      total += 10
    else
      total += value.to_i
    end
  end

  #correct for Aces
  arr.select{|e| e == "Ace"}.count.times do
    total -= 10 if total > 21
  end

  total
end

decks = 4 #Num of Decks
suits = ['Hearts', 'Clubs', 'Spades', 'Diamonds']
cards = ['2', '3', '4', '5', '6', '7', '8', '9', '10',
				 'Jack', 'Queen', 'King', 'Ace']

deck = suits.product(cards) * decks
deck.shuffle!

p_cards = [] #Player Cards
d_cards = [] #Dealer Cards


puts "Welcome to BlackJack! And, what would your name be?"
name = gets.chomp
name2 = "Slick"
	if name == ""
		name = name2
		puts 'No name huh? How about I just call you ' + name + '.'
		puts 'How much you wagering today ' + name + '?'
	else
		puts 'Welcome ' + name + ', please place your bet.'
	end
bet = gets.chomp
	while true
		if bet == ""
			puts "Can't win if you don't bet. Your bet amount " + name + '?'
			bet = gets.chomp
		else bet
			break
		end
	end

p_cards << deck.pop #Cards Dealt
d_cards << deck.pop
p_cards << deck.pop
d_cards << deck.pop

p_total = total(p_cards).to_i
d_total = total(d_cards).to_i

puts 'Here are your cards ' + name + '.'
puts p_cards

puts 'Dealer cards'
puts d_cards[0]
puts 'Second card is face down'

if p_total == 21
  puts "Blackjack! You win!"
  exit
end

while true
	puts "What would you like to do? 'Hit' or 'Stay'?"
	response = gets.chomp
	if response == 'Hit'
		p_cards << deck.pop
		p_total = total(p_cards).to_i
		puts p_cards
  end

  if p_total > 21
    puts 'BUST, You Lose'
    exit
  end

  if response == 'Stay'
    p_total = total(p_cards).to_i
    puts p_cards
    puts name + ' is staying on ' + p_total.to_s + '.'
    break
  end
end


puts "Dealer Cards"
puts d_cards

while true
	if d_total < 17
		puts 'Dealer Hits'
		d_cards << deck.pop
    d_total = total(d_cards).to_i
		puts d_cards
	elsif d_total > 21
		puts "DEALER BUSTS!!!!! YOU WIN!!!!"
		break
		exit
	elsif d_total > p_total
		puts "You lose"
		break
		exit
	elsif d_total == p_total
		puts "Push"
		break
		exit
	else
		puts "You win"
		break
		exit
	end
end

