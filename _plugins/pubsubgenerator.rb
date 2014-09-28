module Jekyll
    class PubSubGenerator < Generator
        require "rubygems"
        require 'net/http'

        def generate(site)
            puts "In PubSubGenerator::generate method\n"
            url = URI.parse('http://pubsubhubbub.appspot.com')
            post_args1 = { 'hub.mode' => 'publish', 'hub.url' => site.config['url'] + 'rss.xml' }
            resp = Net::HTTP.post_form(url, post_args1) { |response|
                p response.status
                p response['content-type']
                response.read_body do |str|
                    puts str
                end
            }
            puts "Leaving PubSubGenerator::generate method\n"
        end
    end
end
