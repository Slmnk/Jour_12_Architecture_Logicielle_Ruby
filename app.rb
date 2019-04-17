require 'bundler'
Bundler.require

$:.unshift File.expand_path("/home/veridis-quote/PROGRAMME_THP/Jour_12_Architecture_Logicielle_Ruby/lib/app", __FILE__)
require 'scrapper.rb'

def save_as_json                              # Prend le hash de la fonction get_townhall_email de la class Scrapper
    json_Hash = Scrapper.new.result           # Et écrit chaque email du hash dans le fichier email.JSON
    File.open("bd/emails.json","w") do |f|
        f.write(json_Hash.to_json)
    end
end


def save_as_spreadsheet
    session = GoogleDrive::Session.from_config("config.json")
    ws = session.spreadsheet_by_key("1Ar64MSajj1hHP6vps-TGmqUn1SsATqW0L6GTjtOAWIA").worksheets[0]
    n = 1
    sheet_Hash = Scrapper.new.result

    sheet_Hash.each do |k,v|
    ws[n, 1] = k
    ws[n, 2] = v
    sleep(1.001)
    n += 1
    ws.save
    end

end

save_as_spreadsheet


def save_as_csv
    csv_Hash = Scrapper.new.result
    CSV.open("bd/emails.csv", "wb") do |csv|
        csv_Hash.to_a.each{|elem| csv << elem}
     end
end
