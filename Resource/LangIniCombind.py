
DDATA = {}

while True:
    fileName = input("\nTell me your file name...\n(use \"exporto\" to Export)\n")

    if fileName.lower() == "exporto":
        with open("Exporto.ini","w",encoding="utf8") as F:
            
            for H in DDATA.keys():
                F.writelines("[{}]\n".format(H))
                for L in DDATA[H].keys():
                    F.writelines("{}={}\n".format(L,DDATA[H][L]))
                F.writelines("\n")
            print("Complete!")
            exit(0)

    Header = "Null"
    try:
        with open(fileName,encoding="utf8") as F:
            Content = F.read()
        Content = Content.split("\n")
        for line in Content:
            if ("[" in line) and ("]" in line):
                Header = line[line.find("[")+1:line.find("]")]


                if not (Header in DDATA):
                    DDATA[Header] = {}
            elif "=" in line:
                Title = line[:line.find("=")]
                Mes = line[line.find("=")+1:]
                DDATA[Header][Title] = Mes

    except:
        print("Hell NO!")
    




