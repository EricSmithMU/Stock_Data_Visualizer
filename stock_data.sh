#!/bin/bash
# Eric Smith (ejsqmt)
clear
echo " ___________________________________ "
echo "|                                   |"
echo "| Welcome to the Stock Interpreter! |"
echo "|___________________________________|"
echo " ---------(Select a Choice)----------"
echo "1. Information About the S&P 500"
echo "2. S&P 500 Data to Examine"
echo "3. Lessons Learned"
echo "4. Exit"
read -p "Enter your choice: " mmchoice
if [ $mmchoice == 1 ]
then
	while true
	do
		clear
		echo " ___________________________________ "
		echo "|                                   |"
		echo "|       What is the S&P 500?        |"
		echo "|___________________________________|"
		echo " ---------(Select a Choice)----------"
		echo ""
		echo -e "\tThe S&P 500 Index, or Standard & Poor's 500 Index, is a market-capitalization-weighted\nindex of 500 leading publicly traded companies in the U.S. It is not an exact list of the top\n500 U.S. companies by market cap becasue there are other criteria to be included in the index.\nThe index is regarded as one of the best gauges of large-cap U.S. equities.\n"
		echo "1. Main Menu"
		echo "2. Exit"
		read -p "Enter your choice: " basdchoice
		case $basdchoice in
			1)
				clear
				echo "Going to Main Menu ."
				sleep 1
				clear
				echo "Going to Main Menu . ."
				sleep 1
				clear
				echo "Going to Main Menu . . ."
				sleep 1
				clear
				source /home/ejsqmt/Final_Project/stock_data.sh
			;;
			2)
				echo "Bye :)"
				sleep 4
				clear
				exit
			;;
			*)
				echo "Please enter a valid choice (1 - 2)"
				sleep 2
			;;
		esac
	done
elif [ $mmchoice == 2 ]
then
	while true
	do
		clear
		echo " ___________________________________ "
		echo "|                                   |"
		echo "|       Stock Data to Examine       |"
		echo "|___________________________________|"
		echo " ---------(Select a Choice)----------"
		echo "1. S&P 500 Companies (Names)"
		echo "2. S&P 500 Companies (Financials)"
		echo "3. Main Menu"
		echo "4. Exit"
		read -p "Enter your choice: " sdechoice
		case $sdechoice in
			1)
				clear
				echo "Getting Current S&P 500 Companies (Names)"
				$(wget -O sandp500names.csv -q https://datahub.io/core/s-and-p-500-companies/r/constituents.csv)
				echo "Done!"
				echo " ___________________________________ "
				echo "|                                   |"
				echo "|       S&P 500 Company Names       |"
				echo "|___________________________________|"
				echo " ---------(Select a Choice)----------"
				echo "1. List S&P 500 Company Symbols"
				echo "2. List S&P 500 Company Names"
				echo "3. List S&P 500 Company Symbols and Names"
				echo "4. Main Menu"
				echo "5. Exit"
				read -p "Enter your choice: " sandpnchoice
				if [ $sandpnchoice == 1 ]
				then
					while true 
					do
						clear
						echo "S&P 500 Company Symbols"
						echo "                       "
						echo $(cat sandp500names.csv | awk -F',' '{print "("$1"), "}')
					        echo "----------------------"	
						echo "(1) Main Menu (2) Back"
					        echo "----------------------"
						read sandpn1choice
						case $sandpn1choice in
							1)
								clear
								echo "Going to Main Menu ."
								sleep 1
								clear
								echo "Going to Main Menu . ."
								sleep 1
								clear
								echo "Going to Main Menu . . ."
								sleep 1
								clear
								source /home/ejsqmt/Final_Project/stock_data.sh
							;;
							2)
								break
							;;
							*)
								echo "Please enter a valid option (1 - 2)"
								sleep 2
							;;
						esac
					done
				elif [ $sandpnchoice == 2 ]
				then
					while true
					do
						clear
						echo "S&P 500 Company Names"
						echo "                     "
						echo $(cat sandp500names.csv | awk -F',' '{print "("$2"), "}')
					        echo "----------------------"	
						echo "(1) Main Menu (2) Back"
					        echo "----------------------"
						read sandpn2choice
						case $sandpn2choice in
							1)
								clear
								echo "Going to Main Menu ."
								sleep 1
								clear
								echo "Going to Main Menu . ."
								sleep 1
								clear
								echo "Going to Main Menu . . ."
								sleep 1
								clear
								source /home/ejsqmt/Final_Project/stock_data.sh
							;;
							2)
								break
							;;
							*)
								echo "Please enter a valid option (1 - 2)"
								sleep 2
							;;
						esac
					done
				elif [ $sandpnchoice == 3 ]
				then
					while true
					do
						clear
						echo "S&P 500 Company Symbols and Names"
						echo "                                 "
						echo $(cat sandp500names.csv | awk -F','  '{print "("$1", "$2"), "}')
					        echo "----------------------"	
						echo "(1) Main Menu (2) Back"
					        echo "----------------------"
						read sandpn3choice
						case $sandpn3choice in
							1)
								clear
								echo "Going to Main Menu ."
								sleep 1
								clear
								echo "Going to Main Menu . ."
								sleep 1
								clear
								echo "Going to Main Menu . . ."
								sleep 1
								clear
								source /home/ejsqmt/Final_Project/stock_data.sh
							;;
							2)
								break
							;;
							*)
								echo "Please enter a valid option (1 - 2)"
								sleep 2
							;;
						esac
					done
				elif [ $sandpnchoice == 4 ]
				then
					clear
					echo "Going to Main Menu ."
					sleep 1
					clear
					echo "Going to Main Menu . ."
					sleep 1
					clear
					echo "Going to Main Menu . . ."
					sleep 1
					clear
					source /home/ejsqmt/Final_Project/stock_data.sh
				elif [ $sandpnchoice == 5 ]
				then
					echo "Bye :)"
					sleep 4
					clear
					exit
				else
					echo "Please enter a valid choice (1 - 5)"
					sleep 2
				fi
			;;
			2)
				clear
				echo "Getting Current S&P 500 Companies (Financial Information)"
				$(wget -O sandp500financials.csv -q https://datahub.io/core/s-and-p-500-companies-financials/r/constituents-financials.csv)
				echo "Done!"
				echo " ___________________________________ "
				echo "|                                   |"
				echo "|     S&P 500 Company Financials    |"
				echo "|___________________________________|"
				echo " ---------(Select a Choice)----------"
				echo "1. Enter a Company's Symbol for Their Financials"
				echo "2. Main Menu"
				echo "3. Exit"
				read -p "Enter your choice: " sandpfchoice
				if [ $sandpfchoice == 1 ]
				then
					while true
					do
						clear
						echo "Enter company symbol: "
						read sandpfschoice
						echo $(cat sandp500financials.csv | grep $sandpfschoice | awk -F',' '{print "("$1") "$2" is in the "$3" Sector."}')
						echo -e "\t--> This is the industry the company is currently in."
						echo ""
						echo $(cat sandp500financials.csv | grep $sandpfschoice | awk -F',' '{print "("$1") "$2" current price is "$4"."}')
						echo -e "\t--> This is the cost of one share of the compant."
						echo ""
						echo $(cat sandp500financials.csv | grep $sandpfschoice | awk -F',' '{print "("$1") "$2" Price/Earnings ratio is "$5"."}')
						echo -e "\t-->The P/E ratio average of the S&P 500 is 22.45\n\t--> This is how many years it takes to earn back your investment.\n\t--> High P/E ratio's often indicated that the stock is over priced."
						echo ""
						echo $(cat sandp500financials.csv | grep $sandpfschoice | awk -F',' '{print "("$1") "$2" Dividend Yeild is "$6"."}')
						echo -e "\t--> The Dividend Yield tells investors what percentage of the share price is paid out in a dividend.\n\t--> The higher the yield the better for investors."
						echo ""
						echo $(cat sandp500financials.csv | grep $sandpfschoice | awk -F',' '{print "("$1") "$2" Earnings/Share is "$7"."}')
						echo -e "\t--> Earnings per Share is how much the company earns per share that is issued.\n\t--> It is calculated by taking the total earnings and dividing it by outstanding shares.\n\t--> A high EPS shows that a company has greater value."
						echo ""
						echo $(cat sandp500financials.csv | grep $sandpfschoice | awk -F',' '{print "("$1") "$2" 52 Week Low is "$8"."}')
						echo -e "\t--> The 52 Week Low indicates the lowest price the stock was traded at in the last 52 weeks."
						echo ""
						echo $(cat sandp500financials.csv | grep $sandpfschoice | awk -F',' '{print "("$1") "$2" 52 Week High is "$9"."}')
						echo -e "\t--> The 52 Week High indicates the highest price the stock was traded at in the last 52 weeks."
						echo ""
						echo $(cat sandp500financials.csv | grep $sandpfschoice | awk -F',' '{print "("$1") "$2" Market Cap is "$10"."}')
						echo -e "\t--> Market Cap is the value of the company based on the number of shares issed and the stock price.\n\t--> It is calculated by multiplying the share price by the number of oustanding shares."
						echo ""
						echo $(cat sandp500financials.csv | grep $sandpfschoice | awk -F',' '{print "("$1") "$2" EBITDA is "$11"."}')
						echo -e "\t--> EBITDA is Earnings before intrest, tax, depreciation, and amortization.\n\t--> EBITDA is a measure of the company's financial performance."
						echo ""
						echo $(cat sandp500financials.csv | grep $sandpfschoice | awk -F',' '{print "("$1") "$2" Price/Sales is "$12"."}')
						echo -e "\t--> The P/S Ratio compares a company's stock price to their revenues.\n\t--> A low ratio may imply the stock is undervalued.\n\t--> The P/S ratio of the S&P 500 is 3.09."
						echo ""
						echo $(cat sandp500financials.csv | grep $sandpfschoice | awk -F',' '{print "("$1") "$2" Price/Book is "$13"."}')
						echo -e "\t--> The P/B Ratio is a measure of the market's valuation to their book value.\n\t--> A P/B Ratio under 1 is consider a good investment."
						echo ""
						echo $(cat sandp500financials.csv | grep $sandpfschoice | awk -F',' '{print "("$1")To find out about the SEC Filings for "$2" visit "$14"."}')
					        echo "-------------------------------------"	
						echo "(1) Main Menu (2) Do Another (3) Back"
					        echo "-------------------------------------"	
						read sandpfechoice
						case $sandpfechoice in
							1)
								clear
								echo "Going to Main Menu ."
								sleep 1
								clear
								echo "Going to Main Menu . ."
								sleep 1
								clear
								echo "Going to Main Menu . . ."
								sleep 1
								clear
								source /home/ejsqmt/Final_Project/stock_data.sh
							;;
							2)
								continue
							;;
							3)
								break
							;;
							*)
								echo "Please enter a valid option (1 - 2)"
								sleep 2
							;;
						esac
					done
				elif [ $sandpfchoice == 2 ]
				then
					clear
					echo "Going to Main Menu ."
					sleep 1
					clear
					echo "Going to Main Menu . ."
					sleep 1
					clear
					echo "Going to Main Menu . . ."
					sleep 1
					clear
					source /home/ejsqmt/Final_Project/stock_data.sh
				elif [ $sandpfchoice == 3 ]
				then
					echo "Bye :)"
					sleep 4
					clear
					exit
				else
					echo "Please enter a valid choice (1 - 4)"
					sleep 2
				fi
			;;
			3)
				clear
				echo "Going to Main Menu ."
				sleep 1
				clear
				echo "Going to Main Menu . ."
				sleep 1
				clear
				echo "Going to Main Menu . . ."
				sleep 1
				clear
				source /home/ejsqmt/Final_Project/stock_data.sh
			;;
			4)
				echo "Bye :)"
				sleep 4
				clear
				exit
			;;
			*)
				echo "Please enter a valid choice (1 - 4)"
				sleep 2
			;;
		esac
	done
elif [ $mmchoice == 3 ]
then
	while true
	do
		clear
		echo " ___________________________________ "
		echo "|                                   |"
		echo "|          Lessons Learned          |"
		echo "|___________________________________|"
		echo "Now let's see how much you've learned"
		echo " ----------(Select a Quiz)-----------"
		echo "1. Take a Quiz"
		echo "2. Main Menu"
		echo "3. Exit"
		read -p "Enter your choice: " llchoice
		case $llchoice in
			1)
				echo " ___________________________________ "
				echo "|                                   |"
				echo "|               Quiz                |"
				echo "|___________________________________|"
				echo ""
				quiz(){
					$(wget -O sandp500financials.csv -q https://datahub.io/core/s-and-p-500-companies-financials/r/constituents-financials.csv)
					echo "What Company Do You Want to be Quized On (Symbol Ex: GOOGL)?"
				       	read cqchoice
					echo "Starting Quiz..."
					q1="$(cat sandp500financials.csv | grep $cqchoice | awk -F',' '{print $1}')"
					q2="$(cat sandp500financials.csv | grep $cqchoice | awk -F',' '{print $3}')"
					q3="Price/Earnings"
					q4="Market Cap"
					q5="EBITDA"	
					echo $(cat sandp500financials.csv | grep $cqchoice | awk -F',' '{print "1. "$2" is in the _________ sector."}')
					read response1
					if [ "$response1" == "$q2" ]
					then
						echo "You Got It!"
					else
						echo "That is incorrect! The correct answer is $q2."
					fi
					echo $(cat sandp500financials.csv | grep $cqchoice | awk -F',' '{print "2. The symbol for "$2" is _________."}')
					read response2
					if [ "$response2" == "$q1" ]
					then
						echo "You Got It!"
					else
						echo "That is incorrect! The correct answer is $q1."
					fi
					echo $(cat sandp500financials.csv | grep $cqchoice | awk -F',' '{print "2. The _________ ratio for "$2" is "$5" (Also known as the P/E ratio)."}')
					read response3
					if [ "$response3" == "$q3" ]
					then
						echo "You Got It!"
					else
						echo "That is incorrect! The correct answer is $q3."
					fi
					echo $(cat sandp500financials.csv | grep $cqchoice | awk -F',' '{print "2. The _________ for "$2" is "$10" (Also known as the value of the company)."}')
					read response4
					if [ "$response4" == "$q4" ]
					then
						echo "You Got It!"
					else
						echo "That is incorrect! The correct answer is $q4."
					fi
					echo $(cat sandp500financials.csv | grep $cqchoice | awk -F',' '{print "2. The _________ for "$2" is "$11" (Short for earnings before interest, tax, depreciation, and amortization)."}')
					read response5
					if [ "$response5" == "$q5" ]
					then
						echo "You Got It!"
					else
						echo "That is incorrect! The correct answer is $q5."
					fi
				}
				SECONDS=0
				quiz
				echo "The quiz took you $SECONDS seconds to complete."
				echo "-------------------------------------"	
				echo "(1) Main Menu (2) Back (3) Exit"
				echo "-------------------------------------"	
				read sandpfechoice
				case $sandpfechoice in
					1)
						clear
						echo "Going to Main Menu ."
						sleep 1
						clear
						echo "Going to Main Menu . ."
						sleep 1
						clear
						echo "Going to Main Menu . . ."
						sleep 1
						clear
						source /home/ejsqmt/Final_Project/stock_data.sh
					;;
					2)
						continue
					;;
					3)
						break
					;;
					*)
						echo "Please enter a valid option (1 - 2)"
						sleep 2
					;;
				esac
					
			;;
			2)
				clear
				echo "Going to Main Menu ."
				sleep 1
				clear
				echo "Going to Main Menu . ."
				sleep 1
				clear
				echo "Going to Main Menu . . ."
				sleep 1
				clear
				source /home/ejsqmt/Final_Project/stock_data.sh
			;;
			3)
				echo "Bye :)"
				sleep 4
				clear
				exit
			;;
			*)
				echo "Please enter a valid choice (1 - 3)"
				sleep 2
			;;
		esac
	done
elif [ $mmchoice == 4 ]
then
	echo "Bye :)"
	sleep 4
	clear
	exit
else
	clear
	echo "Please enter a valid choice (1 - 4)"
	sleep 2
	source /home/ejsqmt/Final_Project/stock_data.sh
fi
