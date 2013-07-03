#BlackJack = 21, pays 1.5times if natural and dealer doesnt have at open
#Ace = 1 or 11
#Dealer hits if the value is less than 17, otherwise must stand.
#Two cards face up to player, one face up for dealer till player done.
#Hash for cards name to number value ???

decks = 4 #Num of Decks
cards = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10] * decks
$s_cards = cards.shuffle
$p_cards = [] #Player Cards
$d_cards = [] #Dealer Cards

def p_deal #Player Dealed Cards
	if $s_cards [0] == 1 && ($p_cards.inject(:+).to_i + 11) > 21
			$p_cards.push 1
			$s_cards.shift
	elsif $s_cards [0] == 1 && ($p_cards.inject(:+).to_i + 11) <= 21
			$p_cards.push 11
			$s_cards.shift
	else $p_cards.push $s_cards [0]
			$s_cards.shift
	end
end


def d_deal #Dealer Dealed Cards
	if $s_cards [0] == 1 && ($d_cards.inject(:+).to_i + 11) > 21
			$d_cards.push 1
			$s_cards.shift
	elsif $s_cards [0] == 1 && ($d_cards.inject(:+).to_i + 11) <= 21
			$d_cards.push 11
			$s_cards.shift
	else $d_cards.push $s_cards [0]
			$s_cards.shift
	end
end


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

puts 'Here are your cards ' + name + '.'
p_deal
p_deal
puts $p_cards

puts 'Dealer cards'
d_deal
d_deal
puts $d_cards[0]
puts 'Second card is face down'

while true
	if $p_cards.inject(:+).to_i <= 21
		puts "What would you like to do? 'Hit' or 'Stay'?"
		response = gets.chomp
			if response == 'Hit'
				p_deal
				puts $p_cards
			elsif response == 'Stay'
				puts $p_cards
				puts name + ' is staying on ' + $p_cards.inject(:+).to_s + '.'
				break
			end
	else $p_cards.inject(:+).to_i > 21
		puts 'BUST, You Lose'
		exit
	end	
end

puts "Dealer Cards"
puts $d_cards

while true
	if $d_cards.inject(:+).to_i < 17
		puts 'Dealer Hits'
		d_deal
		puts $d_cards 			
	elsif $d_cards.inject(:+).to_i > 21
		puts "DEALER BUSTS!!!!! YOU WIN!!!!"
		break
		exit
	elsif $d_cards.inject(:+).to_i > $p_cards.inject(:+).to_i
		puts "You lose"
		break
		exit
	elsif $d_cards.inject(:+).to_i == $p_cards.inject(:+).to_i
		puts "Push"
		break
		exit
	else
		puts "You win"
		break
		exit
	end
end

