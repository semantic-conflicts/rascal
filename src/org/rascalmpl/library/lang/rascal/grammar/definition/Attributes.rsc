@license{
  Copyright (c) 2009-2013 CWI
  All rights reserved. This program and the accompanying materials
  are made available under the terms of the Eclipse Public License v1.0
  which accompanies this distribution, and is available at
  http://www.eclipse.org/legal/epl-v10.html
}
@bootstrapParser
module lang::rascal::grammar::definition::Attributes

import lang::rascal::newsyntax::Rascal;
import lang::rascal::grammar::definition::Literals;
import ParseTree;
import IO;

@doc{adds an attribute to all productions it can find}
public Production attribute(Production p, Attr a) {
  return p[attributes=p.attributes+{a}];
}

public set[Attr] mods2attrs(ProdModifier* mods) {
  return {mod2attr(m) | ProdModifier m <- mods};
}
 
public Attr mod2attr(ProdModifier m) {
  switch (m) {
    case (ProdModifier) `left`: return \assoc(\left());
    case (ProdModifier) `right`: return \assoc(\right());
    case (ProdModifier) `non-assoc`: return \assoc(\non-assoc());
    case (ProdModifier) `assoc`: return \assoc(\assoc());
    case (ProdModifier) `bracket`: return \bracket();
    case (ProdModifier) `@ <Name n> = <StringConstant s>` : return \tag("<n>"(unescape(s)));
    case (ProdModifier) `@ <Name n> = <Literal l>` : return \tag("<n>"("<l>"));
    case (ProdModifier) `@ <Name n>` : return \tag("<n>"());
    case (ProdModifier) `@ <Name n> <TagString s>` : return \tag("<n>"("<s>"));
    default: throw "missed a case <m>";
  }
}
