all: pdf clean

pandoctex:
	@echo "Génération des images avec dot"
	@dot -Tpng -o heritage.png inheritance.gv
	@echo "Génération du fichier tex"
	@pandoc -f rst -t beamer -o slides.tex --template default.beamer\
		-V lang:french\
		-V colortheme:seahorse\
		-V date:"1er octobre 2012"\
		plan.rst
html:
	@pandoc \
		-f rst -t dzslides -o slides.html --template default.dzslides\
		-V lang:french\
		-V date:"1er octobre 2012"\
		-V author:"Clément Delafargue, Alexis Guéganno"\
		plan.rst

pdf: slides.tex
	@echo "Génération du PDF"
	@pdflatex slides.tex
	@pdflatex slides.tex

handouttex: slides.tex
	@sed -i slides.tex -e 's/t,french/t,french,handout/'

handout: handouttex pdf

slides.tex: plan.rst heritage.png
	@echo "Génération du fichier tex"
	@rst2beamer --title="GELOL" \
		--language="fr" \
		--centerfigs="True" \
		plan.rst > slides.tex
	@echo "Conversion en utf8"
	@iconv -f ISO8859-1 -t UTF-8 -o slides-utf.tex slides.tex
	@mv slides-utf.tex slides.tex
	@sed -i slides.tex -e 's/latin1/utf8/'
	@echo "Tweaks d'affichage"
	@sed -i slides.tex -e '/\usetheme/ a\
	\\usecolortheme{seahorse}'
	@sed -i slides.tex -e 's/| alert@\++//g'
	@sed -i slides.tex -e '/\end{itemize}\
	\includegraphics/ a\
	\\pause{}'
	@sed -i slides.tex -e '/\includegraphics/ i\
	\\begin{center}'
	@sed -i slides.tex -e '/\includegraphics/ a\
	\\end{center}'
	@echo "Ajout de blocs"
	@sed -i slides.tex -e '/\\frametitle/ a\
	\\begin{block}{}'
	@sed -i slides.tex -e '/\end{frame}/ i\
	\\end{block}'
	@echo "Ajout d'informations"
	@sed -i slides.tex -e 's/^Intégration continue - dummy title//'
	@sed -i slides.tex -e '/\date/ a\
	\\title{Intégration Continue}'
	@sed -i slides.tex -e 's/author{}/author{Clément \\textsc{Delafargue} \\and Alexis \\textsc{Guéganno}}/'
	@sed -i slides.tex -e 's/date{}/date{26 septembre 2011}/'

heritage.png: inheritance.gv
	@echo "Génération des images avec dot"
	@dot -Tpng -o heritage.png inheritance.gv

clean:
	@echo "Nettoyage des fichiers temporaires"
	@rm slides.tex
	@rm slides.aux
	@rm slides.log
	@rm slides.nav
	@rm slides.out
	@rm slides.snm
	@rm slides.toc
	@rm slides.vrb
	@rm heritage.png

mrproper: clean
	@echo "Suppression du fichier PDF"
	@rm slides.pdf


