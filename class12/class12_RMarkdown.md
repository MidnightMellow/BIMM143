class12\_Structural\_Bioinformatics\_RMarkdown
================

\#\#Prep for docking

We want to produce a protein-only PDB file and a drug only PDB file

``` r
library(bio3d)

# Download the PDB file
get.pdb("1hsg")
```

    ## Warning in get.pdb("1hsg"): ./1hsg.pdb exists. Skipping download

    ## [1] "./1hsg.pdb"

``` r
info <- get.pdb("1hsg")
```

    ## Warning in get.pdb("1hsg"): ./1hsg.pdb exists. Skipping download

For protein:

``` r
pdb <- read.pdb(info)
protein <- atom.select(pdb, "protein", value=TRUE)
write.pdb(protein, file="1hsg_protein.pdb")
```

and for ligand:

``` r
ligand <- atom.select(pdb, "ligand", value=TRUE)
write.pdb(ligand, file="1hsg_ligand.pdb")
```

\#\#Process our docking results

``` r
library(bio3d)

res<- read.pdb("all.pdbqt", multi=TRUE)

write.pdb(res, "results.pdb")
```

``` r
res <- read.pdb("all.pdbqt", multi=TRUE)

ori <- read.pdb("ligand.pdbqt")

rmsd(ori, res)
```

    ##  [1]  0.649  4.206 11.110 10.529  4.840 10.932 10.993  3.655 10.996 11.222
    ## [11] 10.567 10.372 11.019 11.338  8.390  9.063  8.254  8.978
