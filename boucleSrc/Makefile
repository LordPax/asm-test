ASM=as
LD=ld
EXE=boucle
OBJ=$(EXE).o
SRC=$(EXE).asm

all: $(EXE)

$(EXE): $(OBJ)
	$(LD) -o $(EXE) $(OBJ)

$(OBJ): $(SRC)
	$(ASM) -o $(OBJ) $(SRC)

clean:
	rm -f $(OBJ) $(EXE)
