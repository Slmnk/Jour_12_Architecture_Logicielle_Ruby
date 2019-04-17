


class Scrapper



      townhall_url = "http://annuaire-des-mairies.com/95/avernes.html"

      def get_townhall_email(townhall_url)

          page = Nokogiri::HTML(open("#{townhall_url}"))

          city_name = []
          email = []

          city_name << page.xpath('/html/body/div/main/section[1]/div/div/div/p[1]/strong[1]/a').text
          email	<< page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text

          puts city_name
          puts email

          city_name_with_email = Hash[city_name.zip(email)]

        return city_name_with_email

      end


      def get_townhall_urls

          page = Nokogiri::HTML(open("http://www.annuaire-des-mairies.com/val-d-oise.html"))

          townhall_source = "http://www.annuaire-des-mairies.com"

          city_links_list = []

          page.xpath('//a').each do |x|
          city_links_list << townhall_source + x["href"][1...35]

          end

        return city_links_list[8..-2]

      end

      def result

        get_townhall_urls.each do |u| get_townhall_email(u)

      end

      end



end
