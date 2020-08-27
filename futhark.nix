{ mkDerivation, aeson, alex, ansi-terminal, array, base, binary
, blaze-html, bytestring, cmark-gfm, containers, directory
, directory-tree, dlist, file-embed, filepath, free, gitrev, happy
, haskeline, language-c-quote, mainland-pretty, megaparsec, mtl
, neat-interpolation, parallel, parser-combinators, pcg-random
, process, process-extras, QuickCheck, regex-tdfa, srcloc, stdenv
, tasty, tasty-hunit, tasty-quickcheck, template-haskell, temporary
, terminal-size, text, time, transformers, unordered-containers
, utf8-string, vector, vector-binary-instances, versions
, zip-archive, zlib
}:
mkDerivation {
  pname = "futhark";
  version = "0.17.0";
  src = ./.;
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [
    aeson ansi-terminal array base binary blaze-html bytestring
    cmark-gfm containers directory directory-tree dlist file-embed
    filepath free gitrev haskeline language-c-quote mainland-pretty
    megaparsec mtl neat-interpolation parallel pcg-random process
    process-extras regex-tdfa srcloc template-haskell temporary
    terminal-size text time transformers unordered-containers
    utf8-string vector vector-binary-instances versions zip-archive
    zlib
  ];
  libraryToolDepends = [ alex happy ];
  executableHaskellDepends = [ base text ];
  testHaskellDepends = [
    base containers megaparsec mtl parser-combinators QuickCheck tasty
    tasty-hunit tasty-quickcheck text
  ];
  homepage = "https://futhark-lang.org";
  description = "An optimising compiler for a functional, array-oriented language";
  license = stdenv.lib.licenses.isc;
}
