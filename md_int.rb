#!/usr/bin/ruby
# encoding: utf-8

#Zinnur Yeşilyurt - zinnuryesilyurt@gmail.com
#github.com/1zinnur9

require 'redcarpet'
#redcarpet gemini çağırıyoruz. Gel kızım red :)


#Redcarpet'ın Markdown için olan instance methodlarını çağırıp,
#bunları barındıran bir markdown nesnesi oluşturduk.
markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true)

#ARGV ile klavyeden girdi aldım.
#bu girdi içinde dolaşmamın sebebi girdi array cinsinden
#içinde dolaştıklarım ise string
#dosya isimlendirirken tür sıkıntısı yaşamıyoruz
#aynı zamanda komut satırından kaç argüman grilirse girilsin hepsi için çalışıyoruz.
ARGV.each do |a|

    #b = a.gsub(/([.]..)$/, '') dosya .md.html olmasın diye isim düzenlemesi yaptım.
  b = a.gsub(/([.]..)$/, '')
    #/([.]..)$/ anlamı . yı gördüğü yerde string orda bitiriyor. 
    #gsub sayesinde de . yı gördüğü yere '' gibi bi şey atamadan gidiyor.

  bFile = File.new("#{b}.html", "w+")
    #her markdown dosyası kendi orijinal ismiyle html e dönüştürülüyor.
    
    #.html uzantısıyla normalde çalışıyor.
    #Ama Türkçe uyumsuzluğu olmasın!
  bFile.syswrite('<!DOCTYPE html>
		<head>
  		<meta charset="utf-8">
		</head>
		<body>')
  IO.foreach(a){|block| bFile.syswrite(markdown.render(block))}
  bFile.syswrite('</body></html>')
    #markdown dosyalarının her bir satırını ayrı ayrı dönüştürüp yazıyoruz.

end
#Mutlu Son ! :-)

