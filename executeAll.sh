echo "filename: $1"
cat en/sample_en.txt | sed -f en/tokenizer.sed > en/sentences.tok
/home/alex/Desktop/Daniel/learningbyreading/ext/candc/bin/candc --models /home/alex/Desktop/Daniel/learningbyreading/ext/candc/models --candc-printer xml --input en/sentences.tok > en/sentences.candc.xml
python3 en/candc2transccg.py en/sentences.candc.xml > en/sentences.xml
python3 scripts/semparse.py en/sentences.xml en/semantic_templates_en_emnlp2015.yaml en/sentences.sem.xml
python3 scripts/prove.py en/sentences.sem.xml --graph_out en/graphdebug1.html
cp tempeh.txt $1
