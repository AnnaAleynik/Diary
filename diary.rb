# version 0.1

require "./methods"
current_data = File.dirname(__FILE__) + "/note_lists/"


puts "Привет, я твой дневник. Скажи мне что у тебя на уме и в душе?"
puts "Я сохраню всё, что ты напишешь до строчки \"end\" в файл."

entry = read

time =Time.now
day = time.strftime("%Y-%m-%d")
time = time.strftime("%H:%M")

write(current_data, day, time, entry)