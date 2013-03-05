def formt(l):
	f="";
	while len(l)!=1:
		f+=l[0]+"; "+l.pop(1)+"\n"
	return f

def main():
	var = input("fichier; word; synonym; synonym; ...\n")
	var = var.rstrip()
	var = var.split("; ")
	fic = var.pop(0)
	f = formt(var)
	if (f[-2]==";"):
		f = f[:-2]
	fil = open(fic, "a")
	fil.write("\n"+f)
	print(f+"\nAdded to "+fic)


main();