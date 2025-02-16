(:~~~ manual parameters ~~~:)

declare variable $debugging-mode := false();

(:~~~ serialization ~~~:)

declare option output:indent 'yes';
declare option output:indent-attributes 'yes';

(:~~~ rule types ~~~:)

declare variable $atomic-structure-rule := ('Adj2Adjp', 'Adj2Advp', 'Adj2NP', 'Adjp2O', 'Adjp2P', 'Adv2Adj', 'Adv2Advp', 'Adv2Conj', 'Adv2Prep', 'Adv2Ptcl', 'Advp2ADV', 'Advp2P', 'CL2ADV', 'CL2Adjp', 'CL2NP', 'CL2O2x', 'CL2Ox', 'CL2P', 'CL2S', 'CL2VP', 'Conj2Adv', 'Conj2Prep', 'Conj2Pron', 'Conj2Ptcl', 'Det2NP', 'N2NP', 'Np2ADV', 'Np2IO', 'Np2O', 'Np2O2', 'Np2P', 'Np2S', 'Np2pp', 'Num2Nump', 'Nump2NP', 'Pp2np', 'Prep2Adv', 'Pron2NP', 'Ptcl2Adv', 'Ptcl2Conj', 'Ptcl2Intj', 'Ptcl2Np', 'V2VP', 'Vp2Np', 'Vp2P', 'Vp2V', 'adjp2ADV', 'adjp2O2', 'adjp2S', 'adjp2advp', 'advp2np', 'advp2pp', 'intj2Np', 'np2advp', 'pp2ADV', 'pp2P', 'pron2adj', 'ptcl2P', 'ptcl2S', 'vp2VC');
declare variable $modifier-structure-rule := ('NP-Demo', 'All-NP', 'NP-all', '2Advp_h1', '2Advp_h2', 'AdjpAdjp', 'AdjpAdjp2', 'AdjpAdvp', 'AdjpAdvp2Advp', 'AdjpDative', 'AdjpNp', 'AdjpPp', 'AdjpofNp', 'AdvAdv', 'AdvPp', 'AdvpAdjp', 'AdvpNp', 'AdvpNump', 'ConjConj', 'DativeAdjp', 'Demo-NP', 'DetAdj', 'DetAdv', 'DetNP', 'DetNump', 'NPDetAdj', 'NPofNP', 'NpAdjp', 'NpAdvp', 'NpNump', 'NpPp', 'NpPron', 'NumpAdjp', 'NumpNP', 'NumpNump', 'PP-Adjp', 'PpAdvp', 'PpNp2Np', 'PronNP', 'VpVp', 'ofNPNP');
declare variable $wrapper-rule := ('BeVerb', 'PrepNp', 'VerbBe', 'ConjNp', 'NP-Prep');
declare variable $wrapper-clause-rule := ('AdjpCL', 'AdvpCL', 'PtclCL', 'DetCL', 'sub-CL', 'that-VP', 'Conj-CL');
declare variable $apposition-rule := ('Np-Appos'); (: Ryder: 'NP-CL' and 'CL-NP' are apposition, but they are handled in the disambiguate-clause-complex function :) 
declare variable $complex-clause-rule := ('ClCl', 'ClCl2', '2CLaCL', '2CLaCLaCL', 'CLa2CL', 'CLandCL2', 'Conj12CL', 'Conj13CL', 'Conj14CL', 'Conj3CL', 'Conj4CL', 'Conj5CL', 'Conj6CL', 'Conj7CL', 'aCLaCL', 'aCLaCLaCL', 'NP-CL', 'CL-NP');
declare variable $group-rules := ('12Np', '2CLaCL', '2CLaCLaCL', '2Np', '2NpaNpaNp', '2Pp', '2PpaPp', '3Adjp', '3NpaNp', '4NpaNp', '7Np', 'aAdvpaAdvp',  'aCLaCLaCL', 'AdjpaAdjp', 'AdjpAdjpAdjpAdjp', 'AdjpAdjpAdjpAdjpAdjp', 'AdjpAdjpAdjpAdjpAdjpAdjp', 'AdjpAdjpAdjpAdjpAdjpAdjpAdjp', 'AdvpaAdvp', 'AdvpAdvpAdvp', 'aNpaNp', 'aNpaNpaNp', 'aPpaPp', 'aPpaPpaPp', 'CLa2CL', 'CLaCL', 'CLandCL2', 'CLandClClandClandClandCl', 'ClClCl', 'ClClClCl', 'ClClClClCl', 'ClClClClClCl', 'ClClClClClClCl', 'ClClClClClClClCl', 'ClClClClClClClClCl', 'ClClClClClClClClClCl', 'ClClClClClClClClClClClCl', 'Conj12CL', 'Conj12Np', 'Conj13CL', 'Conj14CL', 'Conj2Nump', 'Conj2Nump2', 'Conj2Nump3', 'Conj2P', 'Conj2Pp', 'Conj2VP', 'Conj3Adjp', 'Conj3Advp', 'Conj3CL', 'Conj3Np', 'Conj3P', 'Conj3Pp', 'Conj3VP', 'Conj4CL', 'Conj4Np', 'Conj4P', 'Conj4Pp', 'Conj5AdjP', 'Conj5CL', 'Conj5Np', 'Conj5P', 'Conj5Pp', 'Conj6CL', 'Conj6Np', 'Conj6P', 'Conj7CL', 'Conj7Np', 'Conj7Pp', 'Conj8Np', 'Conj9Np', 'ConjNp', 'EitherAdvpOrPp', 'EitherOr10Np', 'EitherOr3Vp', 'EitherOr4Advp', 'EitherOr4CL', 'EitherOr4Np', 'EitherOr4Vp', 'EitherOr5Vp', 'EitherOr7CL', 'EitherOr8Np', 'EitherOrAdjp', 'EitherOrVp', 'notCLbutCL', 'notCLbutCL2CL', 'notADVbutADV', 'notADVPbutADVP', 'notADJPbutADJP', 'notNPbutNP', 'notPPbutPP', 'notVPbutVP', 'NpaNp', 'NpNpNp', 'NpNpNpNp', 'NpNpNpNpNp', 'NpNpNpNpNpNp', 'NpNpNpNpNpNpNpNp', 'NpNpNpNpNpNpNpNpNp', 'NpNpNpNpNpNpNpNpNpNp', 'NpNpNpNpNpNpNpNpNpNpNpNpNpNpNpAndNp', 'NpNpNpNpNpNpNpNpNpNpNpNpNpNpNpNp', 'NumpNump', 'NumpNumpNump', 'NumpNumpNump2', 'NumpNumpNump3', 'PpPpPp', 'PpPpPpPp', 'PpPpPpPpPp', 'PpPpPpPpPpPpPpPpPpPpPpPpPpPpPpPpPpPpPpPpPp', 'VpVp');
declare variable $conjuncted-structure-rule := ('2CLaCL', '2CLaCLaCL', '2NpaNpaNp', '2PpaPp', '3NpaNp', '4NpaNp', 'ADVaADV', 'AdjpaAdjp', 'AdvpaAdvp', 'CLa2CL', 'CLaCL', 'CLandCL2', 'CLandClClandClandClandCl', 'Conj12CL', 'Conj12Np', 'Conj13CL', 'Conj14CL', 'Conj2Nump', 'Conj2P', 'Conj2Pp', 'Conj2VP', 'Conj3ADV', 'Conj3Adjp', 'Conj3Advp', 'Conj3CL', 'Conj3Np', 'Conj3Pp', 'Conj3VP', 'Conj4CL', 'Conj4Np', 'Conj4Pp', 'Conj5AdjP', 'Conj5CL', 'Conj5Np', 'Conj5Pp', 'Conj6CL', 'Conj6Np', 'Conj6P', 'Conj7CL', 'Conj7Np', 'Conj7Pp', 'Conj8Np', 'Conj9Np', 'ConjNp', 'EitherOr10Np', 'EitherOr3Vp', 'EitherOr4Advp', 'EitherOr4CL', 'EitherOr4Np', 'EitherOr4Vp', 'EitherOr5Vp', 'EitherOr7CL', 'EitherOr8Np', 'EitherOrAdjp', 'EitherOrVp', 'NpNpNpNpNpNpNpNpNpNpNpNpNpNpNpAndNp', 'NpaNp', 'aAdvpaAdvp', 'aCLaCL', 'aCLaCLaCL', 'aNpaNp', 'aNpaNpaNp', 'aPpaPp', 'aPpaPpaPp');
declare variable $auxiliary-rules := ('intjNP');
declare variable $single-constituent-clause-rule := ('IO2CL', 'Intj2CL','Np2CL', 'ADV2CL', 'O2CL', 'P2CL', 'S2CL', 'V2CL', 'VC2CL'); 

(: Ryder: Credit for these particle classifications: Chris Land's prior work on OpenText 2.0 :)
declare variable $relative-nominals := ('ἡλίκος', 'οἷος', 'ὁποῖος', 'ὁπόσος', 'ὅς', 'ὅσγε', 'ὅσος', 'ὅσπερ', 'ὅστις');
declare variable $relative_adverbs_WS := ('ὡς', 'ὥσπερ', 'ὡσεί', 'ὅπως', 'ὅπως', 'ὡσαύτως', 'ὡσπερεί');
declare variable $relative_adverbs := ('ὅπου', 'ὁπότε', 'ὅτε', 'ὅταν', 'ὅθεν', 'ἡνίκα', 'ὁπόθεν', 'ὁπόταν', 'ὁσάκις', 'ὁτέ', 'ὅτου', 'οὗ');
declare variable $affirmation_markers := ('ναί', 'νή', 'δή', 'δήπου', 'μέν', 'μέντοι', 'μενοῦν', 'μενοῦνγε', 'μήν (I)');
declare variable $inferential-markers := ('ἄρα', 'ἆρα', 'τοίνυν', 'πλήν');
declare variable $actualization-markers := ('ἄν', 'ἐάν');
declare variable $focus-markers := ('γέ');
declare variable $discourse_markers := ('γάρ', 'οὖν', 'τοιγαροῦν', 'οὐκοῦν');
declare variable $operators := ('καί', 'δέ', 'ἀλλά', 'καίπερ', 'καίτοι', 'κἄν', 'καίτοιγε', 'ἤ', 'οὐδέ', 'οὔτε', 'μηδέ', 'τέ');
declare variable $complementizers := ('ἵνα', 'ὅτι', 'εἰ', 'μή');
declare variable $subordinators := ('ἵνα', 'ὅτι', 'εἰ', 'εἴπερ', 'ἐάν', 'ἐάνπερ', 'κἄν', 'εἴτε', 'ἐπεί', 'ἐπειδή', 'ἐπειδήπερ', 'ἐπάν', 'μή', 'ἄχρι', 'μέχρι', 'ἕως', 'καθώς', 'καθά', 'καθό', 'καθάπερ', 'καθότι', 'διό', 'διόπερ', 'διότι', 'ἡνίκα');
declare variable $circumstances := ('ἔτι', 'νυνί', 'ὁμοίως', 'πρῶτος', 'ὅμως', 'οὕτω', 'ἐκτός', 'πῶς');
declare variable $all-greek-rough-breathing-vowel-characters := ('ἀ', 'ἁ', 'ἂ', 'ἃ', 'ἄ', 'ἅ', 'ἆ', 'ἇ', 'Ἀ', 'Ἁ', 'Ἂ', 'Ἃ', 'Ἄ', 'Ἅ', 'Ἆ', 'Ἇ', 'ἐ', 'ἑ', 'ἒ', 'ἓ', 'ἔ', 'ἕ', 'Ἐ', 'Ἑ', 'Ἒ', 'Ἓ', 'Ἔ', 'Ἕ', 'ἠ', 'ἡ', 'ἢ', 'ἣ', 'ἤ', 'ἥ', 'ἦ', 'ἧ', 'Ἠ', 'Ἡ', 'Ἢ', 'Ἣ', 'Ἤ', 'Ἥ', 'Ἦ', 'Ἧ', 'ἰ', 'ἱ', 'ἲ', 'ἳ', 'ἴ', 'ἵ', 'ἶ', 'ἷ', 'Ἰ', 'Ἱ', 'Ἲ', 'Ἳ', 'Ἴ', 'Ἵ', 'Ἶ', 'Ἷ', 'ὀ', 'ὁ', 'ὂ', 'ὃ', 'ὄ', 'ὅ', 'Ὀ', 'Ὁ', 'Ὂ', 'Ὃ', 'Ὄ', 'Ὅ', 'ὐ', 'ὑ', 'ὒ', 'ὓ', 'ὔ', 'ὕ', 'ὖ', 'ὗ', 'Ὑ', 'Ὓ', 'Ὕ', 'Ὗ', 'ὠ', 'ὡ', 'ὢ', 'ὣ', 'ὤ', 'ὥ', 'ὦ', 'ὧ', 'Ὠ', 'Ὡ', 'Ὢ', 'Ὣ', 'Ὤ', 'Ὥ', 'Ὦ', 'Ὧ', 'ᾀ', 'ᾁ', 'ᾂ', 'ᾃ', 'ᾄ', 'ᾅ', 'ᾆ', 'ᾇ', 'ᾈ', 'ᾉ', 'ᾊ', 'ᾋ', 'ᾌ', 'ᾍ', 'ᾎ', 'ᾏ', 'ᾐ', 'ᾑ', 'ᾒ', 'ᾓ', 'ᾔ', 'ᾕ', 'ᾖ', 'ᾗ', 'ᾘ', 'ᾙ', 'ᾚ', 'ᾛ', 'ᾜ', 'ᾝ', 'ᾞ', 'ᾟ', 'ᾠ', 'ᾡ', 'ᾢ', 'ᾣ', 'ᾤ', 'ᾥ', 'ᾦ', 'ᾧ', 'ᾨ', 'ᾩ', 'ᾪ', 'ᾫ', 'ᾬ', 'ᾭ', 'ᾮ', 'ᾯ', 'ᾲ', 'ᾳ', 'ᾴ', 'ᾶ', 'ᾷ', 'ᾼ', 'ῂ', 'ῃ', 'ῄ', 'ῆ', 'ῇ', 'ῌ', 'ῲ', 'ῳ', 'ῴ', 'ῶ', 'ῷ', 'ῼ');
declare variable $all-greek-unaccented-vowels := ('α', 'ε', 'η', 'ι', 'ο', 'υ', 'ω', 'Α', 'Ε', 'Η', 'Ι', 'Ο', 'Υ', 'Ω');
declare variable $discontinuous-discourse-nodes := ('n44007007011');

declare function local:is-group($node)
{
    $node/@Rule = $group-rules
};

declare function local:is-simple-clause-rule($rule as attribute()) as xs:boolean
{
	if (not($rule = ('All-NP', 'CL-NP', 'Conj-CL', 'Demo-NP', 'NP-CL', 'NP-Demo', 'NP-Prep', 'NP-all', 'Np-Appos', 'PP-Adjp', 'sub-CL', 'that-VP'))
		and (
			contains($rule, '-')
			or 
			($rule = ('V2CL', 'P2CL'))
		)
	)
	then
		true()
	else
		false()
};

declare function local:USFMBook($nodeId)
{
if(string-length($nodeId) < 1)
then "error5"
else
    switch (xs:integer(substring($nodeId, 1, 2)))
        case 01 return "GEN"
        case 02 return "EXO"
        case 03 return "LEV"
        case 04 return "NUM"
        case 05 return "DEU"
        case 06 return "JOS"
        case 07 return "JDG"
        case 08 return "RUT"
        case 09 return "1SA"
        case 10 return "2SA"
        case 11 return "1KI"
        case 12 return "2KI"
        case 13 return "1CH"
        case 14 return "2CH"
        case 15 return "EZR"
        case 16 return "NEH"
        case 17 return "EST"
        case 18 return "JOB"
        case 19 return "PSA"
        case 20 return "PRO"
        case 21 return "ECC"
        case 22 return "SNG"
        case 23 return "ISA"
        case 24 return "JER"
        case 25 return "LAM"
        case 26 return "EZK"
        case 27 return "DAN"
        case 28 return "HOS"
        case 29 return "JOL"
        case 30 return "AMO"
        case 31 return "OBA"
        case 32 return "JON"
        case 33 return "MIC"
        case 34 return "NAM"
        case 35 return "HAB"
        case 36 return "ZEP"
        case 37 return "HAG"
        case 38 return "ZEC"
        case 39 return "MAL"
        case 40 return "MAT"
        case 41 return "MRK"
        case 42 return "LUK"
        case 43 return "JHN"
        case 44 return "ACT"
        case 45 return "ROM"
        case 46 return "1CO"
        case 47 return "2CO"
        case 48 return "GAL"
        case 49 return "EPH"
        case 50 return "PHP"
        case 51 return "COL"
        case 52 return "1TH"
        case 53 return "2TH"
        case 54 return "1TI"
        case 55 return "2TI"
        case 56 return "TIT"
        case 57 return "PHM"
        case 58 return "HEB"
        case 59 return "JAS"
        case 60 return "1PE"
        case 61 return "2PE"
        case 62 return "1JN"
        case 63 return "2JN"
        case 64 return "3JN"
        case 65 return "JUD"
        case 66 return "REV"
        default return "###"
};

(:declare function local:head($node)
{
    if ($node)
    then
        let $preceding := count($node/preceding-sibling::Node)
        let $following := count($node/following-sibling::Node)
        return
            if ($preceding + $following > 0)
            then
                if ($preceding = $node/parent::*/@Head and $node/parent::*/@Cat != 'conj')
                then
                    attribute head {true()}
                else
                    ()
            else
                local:head($node/parent::*)
    else
        ()

};:)

declare variable $coordinationRule := ("ClClClClClClClClClClClCl", "Conj13CL", "Conj14CL", "Conj12CL", "CLandClClandClandClandCl", "CLaCL", "notCLbutCL2CL", "ClClCl", "Conj3CL", "aCLaCL", "EitherOr7CL", "Conj4CL", "ClClClClCl", "Conj5CL", "EitherOr4CL", "ClClClClClCl", "Conj6CL", "ClClClCl", "aCLaCLaCL", "ClClClClClClClCl", "notCLbutCL", "Conj7CL", "ClClClClClClCl", "ClClClClClClClClCl", "ClClClClClClClClClCl");
declare variable $subordinationRule := ("sub-CL", "CL2P", "CL2S", "CL2VP", "CL2Ox", "CL2NP", "CL2Adjp", "CL2ADV", "CL2O2x");
declare variable $junctionRequiringDisambiguation := ("ClCl", "Conj-CL", "ClCl2", "CLandCL2", "2CLaCLaCL", "2CLaCL", "CLa2CL"); (: Ryder: this set is currently unused as it would require further disambiguation once we decide how we would like to proceed. :)

declare variable $junctionRule := ($coordinationRule, $subordinationRule(:, $junctionRequiringDisambiguation:));
declare variable $nominalized-clause-rule := ('CL2Adjp', 'CL2NP', 'DetCL', 'NP-CL');

declare function local:is-nominalized-clause($node)
{
	$node/@Cat = 'CL' 
    and (
    		$node/parent::Node/@Rule = $nominalized-clause-rule 
    		or $node/descendant::Node[@Cat ne 'CL'][1]/descendant::Node[@Type = 'Relative']
    	)
};

declare function local:attributes($node)
{
	local:attributes($node, ())
};
declare function local:attributes($node, $exclusions)
{
	local:attributes($node, (), ())
};
declare function local:attributes($node, $exclusions, $passed-role)
{
    if (contains($exclusions, 'class')) then
			()
		else
			if ($node/@Rule = ($group-rules, $complex-clause-rule)) then () 
			else
				$node/@Cat ! attribute class {lower-case(.)},
    if (
    	local:is-nominalized-clause($node)
    	) then attribute clauseType {'nominalized'} else (),
    $node[preceding-sibling::*]/parent::*[@Rule = $apposition-rule] ! (if ($passed-role) then () else attribute junction {"apposition"}),
    $node/@Type ! attribute type {lower-case(.)}[string-length(.) >= 1 and not(. = ("Logical", "Negative"))],
    $node/@xml:id,
(:    $node[empty(@xml:id)]/@nodeId ! local:nodeId2xmlId(.),:)
    $node/@HasDet ! attribute articular {true()},
    $node/@UnicodeLemma ! attribute lemma {.},
    $node/@NormalizedForm ! attribute normalized {.},
    $node/@StrongNumber ! attribute strong {.},
    $node/@Number ! attribute number {lower-case(.)},
    $node/@Person ! attribute person {lower-case(.)},
    $node/@Gender ! attribute gender {lower-case(.)},
    $node/@Case ! attribute case {lower-case(.)},
    $node/@Tense ! attribute tense {lower-case(.)},
    $node/@Voice ! attribute voice {lower-case(.)},
    $node/@Mood ! attribute mood {lower-case(.)},
    $node/@Degree ! attribute degree {lower-case(.)},
(:    local:head($node),:)
    $node[empty(*)] ! attribute discontinuous {"true"}[$node/following::Node[empty(*)][1]/@morphId lt $node/@morphId],
    $node/@Rule ! attribute rule {.},
    $node/@Gloss ! attribute gloss {.},
    $node/@LexDomain ! attribute domain {.},
    $node/@LN ! attribute ln {.},
    $node/@FunctionalTag ! attribute morph {.},
    $node/@Unicode ! attribute unicode {.},
    $node/@Frame ! attribute frame {.},
    $node/@Ref ! attribute referent {.},
    $node/@SubjRef  ! attribute subjref {.},
    $node/@ClType ! attribute cltype {.},  (:  ### Remove later - for debugging purposes #### :)
    if (($node/@xml:id, $node/@nodeId) = $discontinuous-discourse-nodes) then
		attribute note {'discontinuous discourse'}
	else
		(),
    
	(: Assign @junction to clauses :)
	if ($node/@Cat = 'CL') then 
        (: Add @junction to clauses based on parent rule :)
        $node/parent::Node/@Rule ! (if (. = ($junctionRule) and not($node[preceding-sibling::*]/parent::*[@Rule = $apposition-rule])) then attribute junction {
         (: Determine correct value for @junction :)
            if (. = $subordinationRule) then 'subordinate'
            else if (. = $coordinationRule) then 'coordinate'
            (:else if (. = $junctionRequiringDisambiguation) then 'unknown':)
            else 'error_unknown_junction_rule'
        } else ())
    else ()
};


(: TODO: the USFM id does not need to be computed from the Nodes trees, since USFM ids are now included on verses and words :)
declare function local:USFMId($nodeId)
{
if(string-length($nodeId) < 1) 
then "error6NoIDFoundInNode"
else
    concat(local:USFMBook($nodeId),
    " ",
    xs:integer(substring($nodeId, 3, 3)),
    ":",
    xs:integer(substring($nodeId, 6, 3)),
    "!",
    xs:integer(substring($nodeId, 9, 3))
    )
};


declare function local:USFMVerseId($nodeId)
{
if(string-length($nodeId) < 1) 
then "error7"
else
    concat(local:USFMBook($nodeId),
    " ",
    xs:integer(substring($nodeId, 3, 3)),
    ":",
    xs:integer(substring($nodeId, 6, 3))
    )
};

declare function local:nodeId2xmlId($nodeId)
{
   attribute xml:id { concat("n", $nodeId) }
};

declare function local:is-peripheral($node)
{
    $node/@ClType="Minor"
    or
    $node/*[@Cat="V"]/descendant::Node[@LN="91.13"]
    (:    Prompters of Attention
        ἄγε     look	91.13
        ἴδε     look!	91.13
        ἰδού    a look!        91.13
        
        
        In theory, the above condition is too general, but applying the following path to the result
        shows that it did not result in false positives:
        
        //comment()[ contains(string(.), "91.3") and count(following-sibling::*[1]/descendant::w) ne 1]
        => empty
        
        //comment()[ contains(string(.), "91.3") and count(following-sibling::*[1]/descendant::w) eq 1]
        => 157 items
    :)
};

declare function local:is-adjunct-cl($node)
{
    $node/@Rule = "sub-CL"
    or
    (
        $node/parent::Node[@Cat="CL" and @Rule=("ClCl","ClCl2")]
        and
        $node/Node[@Cat=("V","VC")]
        /Node[@Cat="vp"]
        /Node[@Cat="verb" and @Mood="Participle" 
        and 
        @Case=("Genitive", "Accusative","Dative")]
    )
};


(:
    TODO:   
        (1) PtclCL and AdvCL should be refactored as in # bug 
        (2) Conj-CL should be turned into unheaded groups.

:)

declare function local:is-object-thatVP($node)
{
    $node/@Rule=("that-VP")
};

declare function local:raise-sibling($parent-node, $child-node-to-raise)
{
    <wg>
     {
        let $processed-node-to-raise := local:node($child-node-to-raise)
        let $before := $parent-node/*[. << $child-node-to-raise]
        let $after := $parent-node/*[. >> $child-node-to-raise]
        return (
            (:  A ClCl or ClCl2 always has @Cat="CL", so it will never have a role. If the raised child has a role, use it. 
            
            Ryder: Identifying the role in this way won't work as expected. The child will not have a role in the ClCl, since even though such Nodes have @Cat="CL", they are most definitely not clauses (so they will not have role constituents, as otherwise the @Rule would be something like "S-V-O") except in case that they involve direct discourse, in which case they SHOULD be clauses, but they still will not have the appropriate roles one would expect.
            :)
            $processed-node-to-raise/@*,
            comment{ $parent-node/@Rule, $child-node-to-raise/@Rule, count($parent-node/*[.<<$child-node-to-raise]) +1  },
            $before ! local:node(.),
            $processed-node-to-raise/node(),
            $after ! local:node(.)
        )
     }
    </wg>
};

declare function local:keep-siblings-as-siblings($node, $passed-role)
{
    <wg>
      {
(:        $node/@nodeId ! local:nodeId2xmlId(.),:)
			if ($node/@Rule=$apposition-rule) then
				attribute type {'apposition'}
			else
				attribute type {'group'}
			,
			local:attributes($node)
			,
			if ($passed-role = 'apposition') then
				attribute junction {$passed-role}
			else if ($passed-role) then
				attribute role {$passed-role}
			else ()
			,  
			$node/Node ! local:node(.)
     }           
    </wg>
};


declare function local:simple-clause($node, $passed-role, $ellipsis-already-processed as xs:boolean?)
{
	if (not($ellipsis-already-processed) and $node/@ClType = 'VerbElided') then
		local:disambiguate-ellipsis($node, $passed-role)
	else
		let $fallback-constituent-role := (if (contains($passed-role, 'ellipsis')) then 
			(:$passed-role:) '' || (if ($debugging-mode) then 'ellipsis' else ()) (: Ryder: TODO I had 'ellipsis' or '...' here; handle ellipsis + role however the team decides to handle this :)
			else '') || (if (contains($node/@Rule, '2CL')) then lower-case(substring-before($node/@Rule, '2CL')) else 'err_no_fallback_constituent_role?')
		let $clause-roles := if (contains($node/@Rule, '-')) then tokenize(lower-case($node/@Rule), '-') else if ($fallback-constituent-role) then $fallback-constituent-role else 'err_no_constituent_role? passed-role: ' || $passed-role
		return
			<wg>{
					local:attributes($node),
					if ($passed-role = 'apposition') then
				        attribute junction {$passed-role}
					else if ($passed-role) then
						attribute role {$passed-role}
					else
						(),
					for $clause-constituent at $index in $node/element()
					let $constituent-role := $clause-roles[$index]
					return
						local:node($clause-constituent, $constituent-role)
				}</wg>
};
 
declare function local:contains-projecting-verb($node)
{

	let $exceptions-to-exclude := ('430090240130012')
	let $exceptions-to-include := ()
	return
		
		$node[@nodeId = $exceptions-to-include]
		or
		(
			$node/descendant::Node[@Cat ne 'CL']/descendant::*[
				starts-with(@LN, '33') 
				or starts-with(@LN, '31')
				or starts-with(@LN, '32')
				or starts-with(@LN, '28') 
				or starts-with(@LN, '30')
				or starts-with(@LN, '25')
				or @UnicodeLemma = "λέγω"
			]
			and not(
				(: Ryder: Exceptions that would otherwise be false positives since they are structurally almost indistinguishable from projecting constructions :)
				$node[@nodeId = $exceptions-to-exclude]
			)
		)
};

declare function local:disambiguate-role-by-subordinate-first-word($subordinate-first-word, $constituent-to-subordinate, $constituent-to-raise)
{							
	if ($subordinate-first-word = $affirmation_markers) then 'adv' || (if ($debugging-mode) then  '___role-by-subordinate-first-word_1' else ())
	else if ($subordinate-first-word = $inferential-markers) then 'adv' || (if ($debugging-mode) then  '___role-by-subordinate-first-word_2' else ())
	else if ($subordinate-first-word = $actualization-markers) then 'adv' || (if ($debugging-mode) then  '___role-by-subordinate-first-word_3' else ())
	else if ($subordinate-first-word = $focus-markers) then 'adv' || (if ($debugging-mode) then  '___role-by-subordinate-first-word_4' else ())
	else if ($subordinate-first-word = $discourse_markers) then 'adv' || (if ($debugging-mode) then  '___role-by-subordinate-first-word_5' else ())
	else if ($subordinate-first-word = $operators) then 
       	if (local:contains-projecting-verb($constituent-to-raise)) then
       	    'o'
       	else
       	    'adv' || (if ($debugging-mode) then  '___role-by-subordinate-first-word_6' else ())
	else if (
		$subordinate-first-word = $complementizers 
		and not($constituent-to-subordinate/@Rule = 'sub-CL')
	) then 'o' || (if ($debugging-mode) then  '_in first-word disambiguation' else ())
	else if ($subordinate-first-word = $subordinators) then 'adv' || (if ($debugging-mode) then  '___role-by-subordinate-first-word_7' else ())
	else if ($subordinate-first-word = $circumstances) then 'adv' || (if ($debugging-mode) then  '___role-by-subordinate-first-word_8' else ())
	else if ($subordinate-first-word = $relative_adverbs_WS) then 'adv' || (if ($debugging-mode) then  '___role-by-subordinate-first-word_9' else ())
	
	else ()
};

declare function local:process-clause-complex-apposition($node, $passed-role)
{
	let $np-constituent := $node/Node[@Cat = 'np']
	let $cl-constituent := $node/Node[@Cat = 'CL']
	return
	if (not($np-constituent)) then
		
		if (local:is-nominalized-clause($node/Node[2])) then
			<wg>{
				attribute class {'np'},
			    attribute type {'apposition'},
			    local:attributes($node, 'class', $passed-role) ! (if (name(.) = 'class') then () else .),
			    if ($passed-role = 'apposition') then
			        ()
				else if ($passed-role) then
					attribute role {$passed-role || (if ($debugging-mode) then  '___clause-complex-apposition_4' else ())}
				else
					(), 
				local:node($node/Node[1]),
				local:node($node/Node[2], 'apposition')
			}
			</wg>
		else
			<error>{
				attribute role {'err_no np constituent'},
				$node/element() ! local:node(.)
			}</error>
	else if (not($cl-constituent)) then
		<error>{
			attribute role {'err_no cl constituent'},
			$node/element() ! local:node(.)
		}</error>
	else
		<wg>{
			attribute class {'np'},
			    attribute type {'apposition'},
		    local:attributes($node, 'class', $passed-role) ! (if (name(.) = ('class', 'junction')) then () else .),
		    if ($passed-role = 'apposition') then
		        attribute junction {$passed-role || (if ($debugging-mode) then  '___clause-complex-apposition_0' else ())}
			else if ($passed-role) then
				attribute role {$passed-role || (if ($debugging-mode) then  '___clause-complex-apposition_1' else ())}
			else
				(),  
		    if ($np-constituent << $cl-constituent) then (
				local:node($np-constituent(:, 'err___debug-sg-constit-1':)),
				local:node($cl-constituent, 'apposition' || (if ($debugging-mode) then  '___clause-complex-apposition_2' else ()))
			)
			else (
				local:node($cl-constituent(:, 'err__debug-sg-constit-2':)),
				local:node($np-constituent, 'apposition' || (if ($debugging-mode) then  '___clause-complex-apposition_3' else ()))
			)
		 }</wg>
};

declare function local:clause-complex-class-attribute($node, $constituent-to-subordinate, $constituent-to-raise, $disambiguated-subordinate-role, $passed-role)
{
	let $exceptions-to-keep-class := (
		'420010010010420' (: Ryder: Luke's preface :)
	)
	let $some-child-is-simple-clause := some $child in $node/Node satisfies (local:is-simple-clause-rule($child/@Rule) or $child[@Cat = 'CL'])
	let $some-child-is-clause-complex-apposition := $passed-role = 'err-apposition?'
	let $all-children-are-single-constituent-clauses := every $child in $node/Node satisfies $child/@Rule = $single-constituent-clause-rule
	
	return
	if ($node/@nodeId = $exceptions-to-keep-class) then
		(
			$node/@Cat ! attribute class {lower-case(.)},
			if($debugging-mode) then attribute debug {'class condition exception id'} else ()
		)
	else if ($constituent-to-raise/@Rule = $atomic-structure-rule) then
		(
			if($debugging-mode) then attribute debug {'class condition - atomic head'} else ()
		)
	else if (
		$some-child-is-simple-clause and not(
			$constituent-to-subordinate/descendant::Node[@Unicode][1]/@Unicode = 'ἐγένετο'
		)
	) then
		(
			$node/@Cat ! attribute class {lower-case(.)},
			if($debugging-mode) then attribute debug {'class condition 1'} else ()
		)
	else if ($all-children-are-single-constituent-clauses)
		then
			(
				$node/@Cat ! attribute class {lower-case(.)},
				if($debugging-mode) then attribute debug {'class condition 2'} else ()
			)
	
	else if ($some-child-is-clause-complex-apposition)
		then
			(
				$node/@Cat ! attribute class {lower-case(.)},
				if($debugging-mode) then attribute debug {'class condition 3'} else ()
			)
	else if ($constituent-to-raise = $single-constituent-clause-rule)
		then
			(
				$node/@Cat ! attribute class {lower-case(.)},
				if($debugging-mode) then attribute debug {'class condition 4'} else ()
			)
	else if (
		$node/Node[1]/@Rule = 'PtclCL'
		and $node/Node[2]/@Rule = 'that-VP'
	) then
		(
			$node/@Cat ! attribute class {lower-case(.)},
			if($debugging-mode) then attribute debug {'class condition 5'} else ()
		)
	else if (
		$node/Node[1]/@Rule = 'PtclCL'
		and $node/Node[2]/@Rule = $complex-clause-rule
	) then
		(
			$node/@Cat ! attribute type {'group'},
			if($debugging-mode) then attribute debug {'class condition 6 - type'} else ()
		)
	else 
		()
};

declare function local:disambiguate-ellipsis($elip-clause as element(Node))
{
	local:disambiguate-ellipsis($elip-clause, ())
};

declare function local:disambiguate-ellipsis($elip-clause as element(Node), $passed-role as xs:string?)
{
	let $preceding-sibling-clause := $elip-clause/preceding-sibling::Node[@Rule][local:is-simple-clause-rule(@Rule)][1]
	let $disambiguated-role := if (local:contains-projecting-verb($preceding-sibling-clause)) then
			(: speech 'ellipsis' :)
			'' || (if ($debugging-mode) then  '.ellipsis_speech' else ())
		else if ($preceding-sibling-clause) then
			(: coordination ellipsis :)
			(if ($debugging-mode) then 'ellipsis_coord' else ()) || $passed-role
		else 
			(: standalone ellipsis :)
			$passed-role || (if ($debugging-mode) then  '.ellipsis_standalone' else ())
	return 
		local:simple-clause($elip-clause, $disambiguated-role, true())	
};

declare function local:previous-sibling-has-role($node as element(Node), $role as xs:string)
{
	some $previous in $node/preceding-sibling::Node satisfies 
	contains($previous/@Rule, $role || '-')
	or contains($previous/@Rule, '-' || $role)
};

declare function local:disambiguate-clause-complex-structure($node, $passed-role)
{
	
	let $rules-that-this-function-disambiguates := ('ClCl', 'ClCl2', 'CLandCL2', 'NP-CL', 'CL-NP')
	let $exceptions-to-skip-complex := (
		'440180060120090', (: Ryder: multiple sentences :)
		'410060380080020', (: Ryder: multiple sentences :)
		'410090050180080' (: Ryder: ellipsis :)
	)
	
	return
		
		if (
			$node/@nodeId = $exceptions-to-skip-complex
		) then
			$node/element() ! local:node(., $passed-role)
		
		(: Ryder: Ensure an error is thrown for cases I have not yet handled. :)
		else if (count($node/child::Node) ne 2) then
			(: Try to process conjunctions and recount :)
			<error_not_two_child_nodes role="error_not_two_child_nodes">
			{local:process-conjunctions($node, $passed-role)}
			</error_not_two_child_nodes>
		else if ($node/@ClType = 'VerbElided') then
			<error_ellipsis_in_clause_complex_function role="err_ellipsis_in_clause_complex_function">
				{local:process-conjunctions($node, $passed-role)}
			</error_ellipsis_in_clause_complex_function>
		else
			if (not($node/@Rule = $rules-that-this-function-disambiguates)) then
				(: Ryder: some other rules should probably be treated as complex clause structure requiring disambiguation (e.g., 'ClaCl'), and if they do, then they should trip this condition until their internal structure disambiguation is handled below :)
				<error_unknown_complex_clause_structure
					role="error_unknown_complex_clause_structure"
					rule="{$node/@Rule}">{
						$node/element() ! local:node(.)
					}</error_unknown_complex_clause_structure>
			
			else
				
				let $first-constituent := $node/child::Node[1]
				let $second-constituent := $node/child::Node[2]
				
				(:
					Ryder: possible analyses for cases I have handled:
					- subordinate first constituent <-- assume case for ClCl
					- subordinate second constituent <-- assume case for ClCl2
					- coordinate constituents (group them) <-- I know this is sometimes the case in the Greek trees (e.g., Matt 12:3), but I'm not sure about the Hebrew trees
					- flatten some series of nested ClCl when they should be groups (e.g., potentially Isaiah 51.9, which has ClCl 4 or 5 deep)
					
					TODO:
					* handle PtclCL, either/or, not/but, etc. in a separate function direction from the node-type() function.
				:)
				
				
				let $exceptions-to-exclude-coordination := (
					'400240260120060' (: Ryder: discontinuous projected speech :)
				)
				
				let $should-coordinate-constituents :=
					not(
						$node/@nodeId = $exceptions-to-exclude-coordination
						or ($first-constituent/@Rule, $second-constituent/@Rule) = ('sub-CL', 'that-VP', 'Intj2CL')
						or (
							(: Ryder: these are typically indirect discourse, which should be nested not grouped :)
							$node/Node/@Rule = 'that-VP'
							and count($node/Node[local:is-nominalized-clause(.)]) eq 0
						)
						or (
							local:is-simple-clause-rule($first-constituent/@Rule)
							and local:contains-projecting-verb($first-constituent)
						)
						or (
							count($node/Node[local:is-nominalized-clause(.)]) eq 1
(:							and not($node/@Rule = ('NP-CL', 'CL-NP')):)
						)
						or (
							count($node/Node[local:is-peripheral(.)]) eq 1
							and $second-constituent/@Rule ne 'P2CL' 
						)
						or (
							$first-constituent/@Rule = ('PtclCL')
							and $second-constituent/@Rule = 'that-VP'
						)
					)
					and
					(
					    $node/@Rule = ('NP-CL', 'CL-NP')
						or (
							(: Ryder: Coordinate when both child nodes are simple clauses and the first is not a projecting clause. :)
							local:is-simple-clause-rule($first-constituent/@Rule) 
							and local:is-simple-clause-rule($second-constituent/@Rule) 
							and not(
								(: Ryder: Often V2CL is a projecting verb, not a simple clause :)
								$first-constituent/@Rule = 'V2CL'
								and local:contains-projecting-verb($first-constituent)
							) 
						)
						or (
							(: Ryder: Coordinate when both child nodes are clause complexes. :)
							$first-constituent/@Rule = ($complex-clause-rule, $coordinationRule, 'Conj-CL')
							and $second-constituent/@Rule = ($complex-clause-rule, $coordinationRule, 'Conj-CL')
						)
						or (
								(: Ryder: Coordinate when one of the children is a "minor" clause. :)
								$first-constituent/@ClType = "Minor"
								or $second-constituent/@ClType = "Minor"
								or $first-constituent[@Rule = "V2CL"][//@LN = ('91.13', '91.14')]
								or (
									(: Ryder: seem to be naming speech acts, e.g., Luke 7:34 'behold! A man...' :)
									local:is-peripheral($first-constituent)
									and $second-constituent[@Rule = 'P2CL']
								)
								
						) 
						or (
							(: Ryder: when the head is a complex of multiple simple clauses, there are several possible analyses :)
							(
								$first-constituent/@Rule = $complex-clause-rule
								and (every $child in $first-constituent/Node[@Rule] satisfies local:is-simple-clause-rule($child/@Rule))
								and local:is-simple-clause-rule($second-constituent/@Rule)
							)
							or 
							(
								$second-constituent/@Rule = $complex-clause-rule
								and (every $child in $second-constituent/Node[@Rule] satisfies local:is-simple-clause-rule($child/@Rule))
								and local:is-simple-clause-rule($first-constituent/@Rule)
							)
						)
						or (
							(: Ryder: krasis in the first word of a constituent should trigger coordination by default :)
							some $first-word in $node/Node/(descendant::Node[@Unicode])[1]/@Unicode satisfies (
								not(substring($first-word, 1, 1) = $all-greek-unaccented-vowels) 
								and substring($first-word, 2, 1) = $all-greek-rough-breathing-vowel-characters
						)
						or local:contains-projecting-verb($node/parent::Node)
						or count($first-constituent/child::Node[@ClType = 'Minor']) eq 2
						
						(: Ryder: or head is group, and subord is simple cl :)
						or (
							$node/@Rule = 'ClCl2'
							and local:is-simple-clause-rule($first-constituent/@Rule)
							and $second-constituent/@Rule = $group-rules
						)
						or (
							$node/@Rule = 'ClCl'
							and local:is-simple-clause-rule($second-constituent/@Rule)
							and $first-constituent/@Rule = $group-rules
						)
						or $node/preceding-sibling::Node/descendant::Node[@Unicode][1]/@Unicode = 'ἐγένετο'
						(: Ryder: assuming GAR should be discourse marker (e.g., Rev 14:4) :)
						or $second-constituent[@Rule = 'sub-CL']/Node[@UnicodeLemma][1]/@UnicodeLemma = 'γάρ'
						or count($node/child::Node[@Rule = $single-constituent-clause-rule]) eq 2
					) 
				)
				
				let $exceptions-to-force-the-second-to-subordinate := (
					'480020040060140', (: Ryder: this appears to be a GBI error, ClCl2 should be ClCl :)
					'400080040060190', (: Ryder: multiple nested projecting verbs :)
					'400090060030130', (: Ryder: projected, but not embedded discourse :)
					'400190180040250', (: Ryder: projected grouped speech :)
					'400240480030130' (: Ryder: GBI error? speech should be embedded, not projecting matrix :)
				)
				
				let $should-subordinate-first := (
					not(
						$node/@nodeId = $exceptions-to-force-the-second-to-subordinate
						or (
							$first-constituent/@Rule = 'PtclCL'
							and $second-constituent/@Rule = 'that-VP'
						)
						or $second-constituent[@Rule = 'sub-CL']
						or ($second-constituent[@ClType = 'Minor'])
					)
					and
					(
						$node/@Rule = ('ClCl2', 'CLandCL2')
						or $first-constituent[@Rule = ('sub-CL')]
						or (
							$first-constituent[@Rule = ('that-VP', 'Intj2CL')] 
							and not(
								local:contains-projecting-verb($second-constituent)
							)
						)
						or (
							(: Ryder: if the projecting verb is non-initial in clause complex; e.g., Acts 7:7 :)
							local:contains-projecting-verb($second-constituent)
							and not(local:contains-projecting-verb($first-constituent))
						)
						or local:is-nominalized-clause($first-constituent)
					)
				)
				
				let $should-subordinate-second := (
					$node/@Rule = ('ClCl')
					or $second-constituent[@Rule = 'sub-CL'] (: Ryder: I'm not sure this makes any difference as the parent is probably a ClCl anyways :)
					or (
						$first-constituent/@Rule = 'PtclCL'
						and $second-constituent/@Rule = 'that-VP'
					)
					or (
						$second-constituent[@Rule = ('that-VP', 'Intj2CL')] 
						and not(
							local:contains-projecting-verb($first-constituent)
						)
					)
					or local:contains-projecting-verb($first-constituent)
					or $node/@nodeId = $exceptions-to-force-the-second-to-subordinate
					or local:is-nominalized-clause($second-constituent)
				)

				(: TODO: Remove these exceptions :)
				
				let $exceptions-to-force-coordination := (
					'410020090010200', '410020090040170', '410020090040070', (: Ryder: in this case, Jesus is asking multiple sibling questions :)
					'410090240080050', (: Ryder: in this case, 'I believe. Help my unbelief.' is syntactically indistinguishable from 'I believe [o help my unbelief]' :)
					'420010230020130', (: Ryder: in this case, the WS clause is part of a ClCl2 but it gets correctly disambiguated to an adverbial downstream, so these can be coordinated. :)
					'440050090060220', (: Ryder: another case of a question followed by another complex clause :)
					'480010200010100', '480010200050070', (: Ryder: the entire verse is introductory/topicalized material for the next verse :)
					'480020100040100', (: Ryder: this was a special case for GAL 2:10, but it might apply more generally, where the entire sentence is a non-verbal predication. :)
					'440130220020280', (: Ryder: multiple sentences. Coreferential tie in second sentence must have triggered a ClCl rule? Note, I'm not convinced by the analysis of the ClCl in this case. :)
					'440130380010050', '440130380070230', (: Ryder: here there is a complex node which combines a nummber of non-simple clauses :)
					(: Ryder: multiple sentences: :)
					'580100070050120', '460150460070050', '420060330030160', '400270460120140', '400260060010240', '400250090060160', '400250060060060', '400160230070070', '400210020030190', '400220040090190', '400150220120100', '440180060120160', '440180150010200', '440180190010150', '410060380050050', '410070180040350', '400170050160120', '400140270080030', '400080030080020', '400080290050130', '400090020190060', '400130290040110',  
					'400130440070240', (: Ryder: complex case of apposition - GBI analysis could be redone to make the subsequent clauses siblings instead of part of the apposition. :)
					'400240150010190', (: Ryder: narrator interjection :)
					'410150340100170', (: Ryder: apposition on direct discourse derived entity :)
					'590050010010120', (: Ryder: prefacing speech act :)
					'430140010060080' (: Ryder: indistinguishable from projection :)
				)
				
				let $exceptions-to-force-projected-discourse := (
					'440050090060220', (: Ryder: projected discourse that begins with a simple 'ὁ Πέτρος δὲ' :)
					'400160030030070' (: Ryder: projected discourse in elliptical junction :)
				)
				let $exceptions-to-exclude-projected-discourse := (
					'480010200050070' (: Ryder: projecting verb is separate sentence/move :)
				)
				
				return
				
					if (
						not($should-coordinate-constituents)
						and not($should-subordinate-first)
						and not($should-subordinate-second)
					) then
						<error role="{'err_clause-complex-met-no-conditions' || $node/@Rule}">{ $node/element() ! local:node(.) }</error>

					else if (
						$should-coordinate-constituents
						or $node/@Rule = ('NP-CL', 'CL-NP')
						or $node/@nodeId = $exceptions-to-force-coordination
					) then (
						if ($node/@Rule = ('NP-CL', 'CL-NP'))
							then
								local:process-clause-complex-apposition($node, $passed-role || (if ($debugging-mode) then  '_group1' else ())) 
						else if (
							some $previous in $node/preceding-sibling::Node satisfies local:contains-projecting-verb($previous)
							and not($node/@nodeId = $exceptions-to-exclude-projected-discourse)
						) 
							then 
								(: Ryder: grouped projected content. :)
								
								(: Ryder: in some edge cases, e.g., MRK 1:24 
								οἶδά [o σε] [: τίς εἶ [: ὁ Ἅγιος τοῦ Θεοῦ]]
								the projecting verb has a proform or other object (cf. JHN 9:25, 'One thing I know... That being blind...', where 'one' is the object, as is ἓν)
								- Such cases could be treated as a second object (or perhaps apposition, though I will go with O2) :)
								if (
									(: embedding clause already has object :)
									local:previous-sibling-has-role($node, 'O')
								) then local:keep-siblings-as-siblings($node, 'o2' || (if ($debugging-mode) then  '_1???' else ()))
								
								else if (local:is-nominalized-clause($second-constituent)) then
									local:process-clause-complex-apposition($node, 'o' || (if ($debugging-mode) then '_appos-1' else ()))
								
								else 
									if ($passed-role = 'apposition') 
										then 
											local:keep-siblings-as-siblings($node, $passed-role || (if ($debugging-mode) then  '_group2' else ()))
									
									else if (count($node/Node[@ClType = 'Minor']) eq 2) then
										local:keep-siblings-as-siblings($node, '' || (if ($debugging-mode) then  '_double-minor-cl-group' else ()))
									
									else
										local:keep-siblings-as-siblings($node, 'o' || (if ($debugging-mode) then '_1???' else ()))
						else if ($node/Node[@Rule = 'that-VP']) then 
							if (local:is-nominalized-clause($node/Node)) then
								(: Ryder: note, you can only get here if you are forcing coordination on a clause complex with a that-VP :)
								(: Ryder: if you have a sentence with no predication, only a bare/non-derived speech act e.g., GAL 2:10 :)
								local:keep-siblings-as-siblings($node, ()|| (if ($debugging-mode) then  '___adverbial that-VP in naming speech act' else ()))
							
							else if (
								(: Ryder: if you run into a clause complex here it is likely a case of projected indirect discourse, and it shouldn't be coordinated but subordinated. :)
								$second-constituent/@Rule = $complex-clause-rule
							) then local:keep-siblings-as-siblings($node, 'err_projected-indirect-discourse-in-group?' || ' Parent: ' || $node/@Rule || $node/@nodeId || ' second-child: ' || $second-constituent/@Rule )
							
							else 
								local:keep-siblings-as-siblings($node, 'err_unhandled grouped complex - should not get here' || ' Parent: ' || $node/@Rule || $node/@nodeId || ' second-child: ' || $second-constituent/@Rule ) 
						
						else if (
							(
								$first-constituent[@Rule = "V2CL"][//@LN = ('91.13', '91.14')]
								and $second-constituent/@Rule = ($complex-clause-rule, $group-rules)
							)
							or (
								$first-constituent/@Rule = ($complex-clause-rule, $group-rules)
								and $second-constituent[@Rule = "V2CL"][//@LN = ('91.13', '91.14')]
							)
						) then
							local:process-wrapper-clause($node, $passed-role || (if ($debugging-mode) then  '_3???'  else ()))
						
						else 
							local:keep-siblings-as-siblings($node, $passed-role || (if ($debugging-mode) then  '_default???' else ())) (: Ryder TODO: remove the concatenated _default??? when debugging complete :)
					)
					else 
					
						let $constituent-to-raise := 
							if ($should-subordinate-first) then
								$second-constituent
							else if ($should-subordinate-second) then
								$first-constituent
							else ()
								
						let $constituent-to-subordinate := 
							if ($should-subordinate-first) then
								$first-constituent
							else if ($should-subordinate-second) then
								$second-constituent
							else ()
						
						let $subordinate-first-word := $constituent-to-subordinate//Node[@UnicodeLemma][1]/@UnicodeLemma
						
						let $disambiguated-subordinate-role := (
							
							(: Ryder: Special cases and/or exceptions (i.e., places where the GBI analysis should be changed) :)
							if ($node/@nodeId = '410010440040040' (: Here Jesus says '[v see] [o [you tell no one nothing]] :)) then 
								'o'
							else if ($constituent-to-subordinate/@nodeId = '420010010010230') then
								'adv'
							else if ($constituent-to-subordinate/@Rule = $complex-clause-rule) then
								if ($constituent-to-raise/@ClType = 'Verbless') then
									(: Ryder TODO: disambiguate these (e.g., MRK 12:31). Some of them seem to be projected, but they still are probably best analyzed as apposition. :)
									'apposition' || (if ($debugging-mode) then  '_verbless apposition' else ())
								else if (local:contains-projecting-verb($constituent-to-raise)) then
									if (every $child in $constituent-to-subordinate/Node satisfies $child/@ClType = 'Minor') then
										'' || (if ($debugging-mode) then  '_null-role' else ())
									else if (
										local:is-nominalized-clause($constituent-to-subordinate)
									) then
										
										'apposition' || (if ($debugging-mode) then  '_nominalized-cl' else ())
									else
										'o' || (if ($debugging-mode) then  '_a' else ())
								
								else if ($constituent-to-subordinate/@nodeId = $exceptions-to-force-projected-discourse) then
									'o' || (if ($debugging-mode) then  '_a_b' else ())
								
								else if (contains(($constituent-to-subordinate//Node[@Unicode])[1]/text(), '—')) then
									(: Ryder: Interruptions often occur in this context. If the first word begins with an en/em dash, then it is an interjection, and should have no role :)
									''
									
								else if ($constituent-to-subordinate/@nodeId = '410080190010130') then
									(: Ryder: this is an erroneous GBI analysis where the sub-CL in this ClCl2 should be the object of the parent ClCl, not subordinate to the simple clause grandchild. :)
									'o' (: Ryder: by making it an 'o' right now, the entire ClCl2 becomes the object of the verb 'to remember', which is a possible though unlikely analysis in my opinion. :)
									
								else if (every $child in $constituent-to-subordinate/Node satisfies $child[(@ClType = "VerbElided" or @Cat = "conj")]) then
									'ellipsis' || (if ($debugging-mode) then  '_clausecomplex' else ())
								else if ($subordinate-first-word = $relative-nominals) then
									'apposition'
								
								(: Ryder: note that this is an 'err_' fallback case :)
								else 'apposition' || (if ($debugging-mode) then $node/@Rule || ' subord: ' || $constituent-to-subordinate/@Rule else ())
							
							else if (local:is-simple-clause-rule($constituent-to-subordinate/@Rule)) then
								(: Ryder: there are several cases where a simple clause will be subordinated :)
								
								(: Ryder: genitive absolutes :)
								if (some $verb in $constituent-to-subordinate/Node[@Cat = ('V', 'VC')] satisfies $verb//@Mood = 'Participle') then
									if ($constituent-to-raise/@Rule = ($complex-clause-rule, $group-rules)) then
										if ($constituent-to-raise << $constituent-to-subordinate) then
											'tail'
										else
											'topic'
									else
										'adv' || (if ($debugging-mode) then  '__gen. abs.' else ())
								
								(: Ryder: topicalized relative clause :)
								else if (local:is-nominalized-clause($constituent-to-subordinate)) then
									'adv' || (if ($debugging-mode) then  '__nom. cl.' else ())
								
								(: Ryder: if the subordinate clause is single-constituent, then there are several possibilities :)
								else if ($constituent-to-subordinate/@Rule = $single-constituent-clause-rule) then
									if (local:is-peripheral($constituent-to-subordinate)) then
										'aux' || (if ($debugging-mode) then  '__periph' else ())
									else if (local:contains-projecting-verb($constituent-to-raise)) then
										(: Ryder: direct discourse :)
										'o' || (if ($debugging-mode) then  '__projected-single-constituent-clause' else ())
									else if ($constituent-to-subordinate/@Rule = 'V2CL') then
										'o' || (if ($debugging-mode) then  '_object V2CL?' else ())
									else if ($constituent-to-subordinate/@Rule = 'P2CL') then
										'err_P2CL--what role should this be?'
									else
										'err__unhandled-subordinated-single-constituent-clause' || $constituent-to-subordinate/@Rule
								
								(: Ryder: direct discourse :)
								else if (local:contains-projecting-verb($constituent-to-raise)) then
									'o' || (if ($debugging-mode) then  '__raised-constituent-has-projecting-verb' else ())
								(: Ryder: projected discourse that begins with 'ὁ δὲ' - the gloss of δέ is something like 'said', 'say', etc. :)
								else if (contains($node/ancestor::Sentence/descendant::Node[@UnicodeLemma="δέ"][1]/@Gloss, ('sa'))) then
									'o' || (if ($debugging-mode) then  '__projected-discourse-that-begins-with-ὁ δὲ' else ())
								
								(: Ryder: simple-cl subordinate with raised complex of simple-cls :)
								else if (
									$constituent-to-raise/@Rule = $complex-clause-rule
									and (every $child in $constituent-to-raise/Node[@Rule] satisfies local:is-simple-clause-rule($child/@Rule))
									and local:is-simple-clause-rule($constituent-to-subordinate/@Rule)
								) then
									(: Ryder: when the head is a complex of multiple simple clauses, there are several possible analyses :)
									(:if () then
										''
									else:)
										'err_head-is-complex-of-simple-clauses-and-sub-is-simple-clause'
								
								else if ($constituent-to-subordinate/descendant::Node[@Unicode][1]/@Unicode = 'ἐγένετο') then
									'adv' || (if ($debugging-mode) then  'topic' || '__egeneto' else ())
									
								else if (every $child in $constituent-to-subordinate/Node satisfies $child[@Cat = 'ADV']) then
									'adv'
								
								else
									'err__subordinated simple cl.,' || '
									parent rule: ' || $node/@Rule || '
									head rule: ' || $constituent-to-raise/@Rule || '
									subord. rule: ' || $constituent-to-subordinate/@Rule || '
									id: ' || 
									'parent has projecting verb: ' || local:contains-projecting-verb($node/parent::Node)
									|| $node/@nodeId
							
							else if ($constituent-to-raise/@Rule = $complex-clause-rule) then
								(: Ryder: a clause complex as the head involves some fairly diverse structures :)
							 	if ($constituent-to-subordinate/@Rule = $complex-clause-rule) then
									'err_every_child_is_complex'
								else if ($constituent-to-raise/@ClType = 'Minor') then
									'err_raised-child-has-minor-clause?'
								else if ($constituent-to-raise/@Rule = $group-rules) then
									(:'err_raised-child-constituents-should-be-siblings':)
									'adv' (: Ryder: In these cases (e.g., a sub-CL modifying a group), 'adv' is just a general category. These could theoretically be broken down further into things like conditionals (EI), temporal markers (OTE/OTAN/etc.), and so on. :)
								
								else if ($constituent-to-subordinate/@Rule = 'sub-CL') then
									'adv'  || (if ($debugging-mode) then '_sub-cl in clause complex' else ())
								else if (
								        $constituent-to-subordinate/@Rule = 'that-VP'
								        or (
								            local:contains-projecting-verb($constituent-to-raise)
								            and $constituent-to-subordinate/@Rule = 'sub-CL'
								        )
								    ) then
									'o' || (if ($debugging-mode) then  '_that-vp or sub-cl that should be that-vp' else ())
								else if (local:disambiguate-role-by-subordinate-first-word($subordinate-first-word, $constituent-to-subordinate, $constituent-to-raise))
									then local:disambiguate-role-by-subordinate-first-word($subordinate-first-word, $constituent-to-subordinate, $constituent-to-raise)
								
								else if ($constituent-to-subordinate/@Cat = 'np') then
									'apposition' || (if ($debugging-mode) then  '_raised-complex-child' else ())
								
								else if ($constituent-to-subordinate/@Rule = 'PtclCL') then
									'' || (if ($debugging-mode) then  '_PtclCL' else ())
								
								else if ($constituent-to-subordinate/@Rule = 'S2CL') then
									'o' (: Ryder: there is only one of these in Acts 27:44, but it is a case of ellipsis :)
								
								else if ($constituent-to-subordinate/@Rule = 'ADV2CL') then
									(: Ryder: prefacing topics in 1 John e.g., 1 John 3:24 :)
									'apposition'
								
								else 'err_group? subord child rule = ' || $constituent-to-subordinate/@Rule
							
							else if ($constituent-to-raise/@Rule = $group-rules) then
								(: Ryder TODO: disambiguate when the raised child is a group :)
								if ($constituent-to-subordinate/@Rule = 'sub-CL') then
									(: Ryder: sub-CLs subordinated to groups are often conditionals, e.g., MRK 3:26 :) 
									''
								else if ($constituent-to-subordinate/@Rule = $auxiliary-rules) then 
									'aux'|| (if ($debugging-mode) then  '_aux1' else ())
								else if ($subordinate-first-word = $relative_adverbs_WS) then
									(: Ryder: if the first word of the subordinated unit is ὡς, then it could be an argument rather than an adjunct. :)
									if ($constituent-to-subordinate/@Rule = $single-constituent-clause-rule) then
										if ($constituent-to-subordinate/@Rule = 'P2CL') then
											''
										else if ($constituent-to-subordinate/@Rule = 'ADV2CL') then
											'adv' (: Ryder: note that analysis in Acts 13.19 of WS should be made an adv on the immediately preceding clause, not the entire complex/chain that precedes :)
										else
											'err_unhandled-WS-to-' || lower-case(substring-before($constituent-to-subordinate/@Rule, '2CL'))
									else 
										'err_WS'
								else if (local:is-simple-clause-rule($constituent-to-subordinate/@Rule)) then
									(: Ryder: when the raised child is a group, and the subordinated child is a simple clause, it is likely a topic, an absolute, or some other fronted element :)
									if (some $verb-mood in $constituent-to-subordinate/descendant::Node[@Rule][not(local:is-simple-clause-rule(@Rule))]//@Mood satisfies $verb-mood = 'Participle') then
										'adv'
									else 
										'err_unhandled-subordinated-simple-clause-modifying-group'
								else if (
									not(local:contains-projecting-verb($node/preceding-sibling::Node))
									and $constituent-to-subordinate/@Rule = 'O2CL'
								) then
									'o' || (if ($debugging-mode) then  '__grouped' else ())
								else if ($constituent-to-subordinate/@Rule = 'S2CL') then
									'ellipsis' || (if ($debugging-mode) then  '__grouped' else ())
								else if ($constituent-to-subordinate/@Rule = 'ADV2CL') then
									'adv' || (if ($debugging-mode) then  '__grouped' else ())
								else if ($constituent-to-subordinate/@Rule = $atomic-structure-rule) then
									''
								else if ($constituent-to-subordinate/@Rule = 'that-VP') then
									'apposition' (: Ryder: e.g., Jas 5:11 :)
								
								else
									'err_raised-child-is-group? raised child rule: ' || $constituent-to-raise/@Rule
								
							else if (local:is-nominalized-clause($constituent-to-subordinate) or $constituent-to-subordinate/@Rule = 'P2CL') then
								'apposition'
							else if ($constituent-to-subordinate/@Rule = $group-rules) then
								if (local:contains-projecting-verb($constituent-to-raise)) then
									'o' || (if ($debugging-mode) then '_b' else ())
								else
									'apposition'
							else if ($constituent-to-subordinate//@LN = ('91.13', '91.14')) then
								'aux' || (if ($debugging-mode) then  '_aux2' else ())
							
							else if ($constituent-to-subordinate/@Rule = 'ADV2CL') then
								'adv'
							else if (
							     local:contains-projecting-verb($constituent-to-raise)
							     and not($constituent-to-subordinate/@Rule = 'sub-CL')
							) then
								if (local:disambiguate-role-by-subordinate-first-word($subordinate-first-word, $constituent-to-subordinate, $constituent-to-raise)) then
									local:disambiguate-role-by-subordinate-first-word($subordinate-first-word, $constituent-to-subordinate, $constituent-to-raise)
								else
									'o' || (if ($debugging-mode) then '_c' else ())
							else if ($constituent-to-subordinate[@ClType = 'Minor']) then
								'aux' || (if ($debugging-mode) then  '_aux3' else ())
							else if ($constituent-to-subordinate[@Rule = 'that-VP']) then
								if (
									(: Ryder: check whether constituent of embedding clause already has 'o' role :)
									local:previous-sibling-has-role($constituent-to-subordinate, 'O')
								) then
									'o2' || (if ($debugging-mode) then '_d' else ())
								else
									'o' || (if ($debugging-mode) then '_d' || data($node/@nodeId)  else ())
							
							else if (local:disambiguate-role-by-subordinate-first-word($subordinate-first-word, $constituent-to-subordinate, $constituent-to-raise))
								then local:disambiguate-role-by-subordinate-first-word($subordinate-first-word, $constituent-to-subordinate, $constituent-to-raise)
							
							else if ($constituent-to-subordinate/@Rule = 'Conj-CL') then
								local:disambiguate-role-by-subordinate-first-word($subordinate-first-word, $constituent-to-subordinate, $constituent-to-raise)

							else switch($constituent-to-subordinate/@Rule)
								case 'sub-CL' return 'adv'  || (if ($debugging-mode) then '_fallback-sub-cl' else ())
								case 'PtclCL'
									(: Ryder TODO: disambiguate PtclCL subordinates :)
									return 'adv'
								case 'O2CL'
									return 'o'
								default return 'err-unhandled-subord-role: ' || $constituent-to-subordinate/@Rule
						)
						
						let $processed-head :=
							if ($constituent-to-raise/@Rule = $atomic-structure-rule) then
								local:node($constituent-to-raise, ())
							else
								local:node($constituent-to-raise, ())/element()
						let $processed-subordinate := 
							if ($constituent-to-subordinate/@Rule = 'V2CL' and $disambiguated-subordinate-role = 'aux' and not(count($node/child::Node[@Rule = $single-constituent-clause-rule]) eq 2)) then 
								local:node($constituent-to-subordinate/Node, $disambiguated-subordinate-role)
							else local:node($constituent-to-subordinate, $disambiguated-subordinate-role)
						
						return
							<wg>{
								
									$node/@Rule,
									$should-coordinate-constituents ! (if ($debugging-mode) then attribute should_coord {.} else ()),
									$constituent-to-subordinate/@Cat ! (if ($debugging-mode) then attribute child_cat {$constituent-to-subordinate/@Cat} else ()),
									$constituent-to-subordinate/@Rule ! (if ($debugging-mode) then attribute child_rule {$constituent-to-subordinate/@Rule} else ()),
									$constituent-to-raise/@Cat ! (if ($debugging-mode) then attribute head_cat {$constituent-to-raise/@Cat} else ()),
									$constituent-to-raise/@Rule ! (if ($debugging-mode) then attribute head_rule {$constituent-to-raise/@Rule} else ()),
									local:clause-complex-class-attribute($node, $constituent-to-subordinate, $constituent-to-raise, $disambiguated-subordinate-role, $passed-role),
									$node/@nodeId,
									if ($constituent-to-raise/@Rule = $atomic-structure-rule) then
										local:attributes($processed-head)
									else
										(if ($debugging-mode) then  attribute debug_attributes {'node attributes skipped because node was not atomic'} else ()),
									if ($passed-role = 'apposition') then
                 				        attribute junction {$passed-role}
                 					else if ($passed-role) then
										attribute role {$passed-role || (if ($debugging-mode) then  '__default' else ())}
									else
										(),
									
									if ($constituent-to-raise << $constituent-to-subordinate) then (
										$processed-head,
										$processed-subordinate
									)
									else (
										$processed-subordinate,
										$processed-head
									)
									
								}</wg>
};

declare function local:process-wrapper-clause($node, $passed-role)
{
	(: Ryder TODO: Disambiguate these rules, including 
		* PtclCL
		* Conj-CL
		* V2CL
	   These need thorough disambiguation, since some cases (e.g., ἃν, εἰ, ἀμήν, οὐχὶ, πως, ἰδοῦ [which could get passed here from disambiguate-clause-complex], etc.) should be subordinated within their clause complex as adverbials.
	   Other cases should be subordinated as auxiliaries (e.g., Ὦ)
	   Still other cases are, via crasis/derivation, true clause wrappers/conjuncted word groups (e.g., Ἄραγε)
	:)
	
	
	if (count($node/element()) > 2) then
		<error_too_many_nodes_in_wrapper_structure
			role="error_too_many_nodes_in_wrapper_structure">
			{$node/element() ! local:node(.)}
		</error_too_many_nodes_in_wrapper_structure>
	
	else 
		let $first-constituent := $node/child::Node[1]
		let $second-constituent := $node/child::Node[2]
		
		let $auxiliary-domains := ('91.13', '91.14')
		let $undetermined-wrapper-lemmas := (
			$discourse_markers,
			$circumstances,
			$subordinators,
			$complementizers,
			$operators,
			$relative_adverbs,
			$relative_adverbs_WS,
			$inferential-markers
		)
		let $adverbial-lemmas := (
			$actualization-markers,
			$focus-markers,
			$affirmation_markers,
			$relative-nominals
		)
		
		let $should-embed-first := (
			$first-constituent[@Rule = "V2CL"][descendant::*[@LN = $auxiliary-domains]]
			or
			(
				$node/@Rule = ('PtclCL', 'Conj-CL')
				and $first-constituent/descendant::*[@lemma = $adverbial-lemmas]
			)
		)
		
		let $should-embed-second := (
			$node/@Rule = ('PtclCL', 'Conj-CL')
			and $first-constituent/descendant::*[@lemma = $undetermined-wrapper-lemmas]
		)
				
		
		let $constituent-to-raise := 
			if ($should-embed-first) then
				$second-constituent
			else if ($should-embed-second) then
				$first-constituent
			else ()
				
		let $constituent-to-embed := 
			if ($should-embed-first) then
				$first-constituent
			else if ($should-embed-second) then
				$second-constituent
			else ()
			
		return
			if ($should-embed-first or $should-embed-second) then
			
				let $subordinate-first-word := $constituent-to-embed//Node[@UnicodeLemma][1]/@UnicodeLemma
				let $disambiguated-embedded-role := (
					if ($node/@Rule = 'sub-CL') then
						'adv' || (if ($debugging-mode) then '__wrap-sub-cl' else ())
					else if ($constituent-to-embed[@Rule = "V2CL"][descendant::*[@LN = $auxiliary-domains]]) then
						'aux' || (if ($debugging-mode) then '__wrap' || $should-embed-first else ())
					else if ($subordinate-first-word = $adverbial-lemmas) then
						'adv' || (if ($debugging-mode) then '__wrap' else ())
					else if ($subordinate-first-word = $undetermined-wrapper-lemmas) then
						$passed-role || (if ($debugging-mode) then  '_wrap_default_type' else ())
					else
						'err_unhandled_wrapper_type'
				)
				
				let $processed-head := local:node($constituent-to-raise, ())
				let $processed-subordinate := if (count($constituent-to-embed/child::element()) = 1) then 
					(: Ryder: if the constituent to subordinate is an atomic element, skip over the unnecessary node :)
					(local:node($constituent-to-embed/element(), $disambiguated-embedded-role || (if ($debugging-mode) then  '__??' else ()))) 
					else local:node($constituent-to-embed, $disambiguated-embedded-role)
						
						return
							<wg>{
							
									(:$node/@Rule,:)
									(:$constituent-to-embed/@Cat ! attribute child_cat {$constituent-to-embed/@Cat},
									$constituent-to-embed/@Rule ! attribute child_rule {$constituent-to-embed/@Rule},
									$constituent-to-raise/@Cat ! attribute head_cat {$constituent-to-raise/@Cat},
									$constituent-to-raise/@Rule ! attribute head_rule {$constituent-to-raise/@Rule},:)
									local:clause-complex-class-attribute($node, $constituent-to-embed, $constituent-to-raise, $disambiguated-embedded-role, $passed-role),
									$node/@nodeId,
									local:attributes($processed-head),
									if ($passed-role = 'apposition') then
                   				        attribute junction {$passed-role}
                   					else if ($passed-role) then
										attribute role {$passed-role || (if ($debugging-mode) then  '__clause-wrapper-1' else ())}
									else
										(),
									
									if ($constituent-to-raise << $constituent-to-embed) then (
										$processed-head/element(),
										$processed-subordinate
									)
									else (
										$processed-subordinate,
										$processed-head/element()
									)
									
								}</wg>
			else
				<wg>{
						local:attributes($node, 'class') ! (if (name(.) = 'class') then () else .),
						if ($passed-role = 'apposition') then
         			        attribute junction {$passed-role}
         				else if ($passed-role) then
							attribute role {$passed-role || (if ($debugging-mode) then  '__clause-wrapper-2' else ())}
						else
							(),
						(:attribute type {"wrapper-clause-scope"},:)
						$node/element() ! local:node(.)
					}</wg>
};

declare function local:process-conjunctions($node, $passed-role)
{
<wg>{
		local:attributes($node, 'class') ! (if (name(.) = 'class') then () else .),
		if ($passed-role = 'apposition') then
				attribute junction {$passed-role}
		else if ($passed-role) then
			attribute role {$passed-role}
		else
			(),
		for $constituent at $index in $node/element()
		return
			(: Ryder: if constituent is conj (different than Hebrew trees in this regard), embed immediately following sibling :)
			if ($constituent/@Cat = ('conj')) then
				<wg>{
				        (:attribute type {'conjuncted-wg'},:)
				        attribute type {'group'},
						$constituent ! local:node(.),
						$constituent/following-sibling::element()[1] ! local:node(.)
					}</wg>
			else
				(: Ryder: handle sibling following conj :)
				if ($constituent/preceding-sibling::element()[1]/@Cat = ('conj')) then
					()
				else
					$constituent ! local:node(.)
	}</wg>
};

declare function local:process-single-constituent-clause($node, $passed-role)
{
	(:
	
	Ryder FIXME: these rules reflect the Hebrew trees - they need to be refactored based on the Greek trees.
	
		Rules to handle here:
		* ADV2CL - Done; needs revisiting
		* Intj2CL - Done
		* Np2CL - Done; Ryder: these are mostly topics, though there are some tails (e.g., JOB 19:21); these are almost always in complex clause structures
		* O22CL - Done; needs revisiting
		* O2CL - Done; needs revisiting; usually the child of a relCL, but sometimes a complex clause structure
		* P2CL - Done
		* PP2CL - Done
		* Relp2CL - Done; needs revisiting: the ones I looked at all have some kind of additional wrapper which likely has an ADV role if anything.
		* S2CL - Ryder TODO: always the child of a complex clause structure. These need to be disambiguated carefully. Sometimes they are actually interpersonal moves such as affirmative responses (GEN 27:24!1). At other times they are simply eliptical/junctive constructions (both conjunctive, e.g., GEN 26:26!1, GEN 50:8!1, LEV 16:29!5, LEV 21:18!2, NUM 26:40!1, and also disjunctive, e.g., NUM 26:65!12). At other times they are appositional in poetry (e.g., GEN 49:7!5). At still other times they are simply verbless clauses in a ClCl (e.g., EXO 8:17!15), adverbial constituents of the headed clause in a CLa2CL (e.g., EXO 16:6!8), or items in a list (e.g., numerous instances in JOS 15:34), and likely others. It is probable that better disambiguation of complex clause structures will resolve many of these problems, and at the very least the disambiguation has to happen atthat stage of this query.
		* V2CL - Done
	:)
	let $internal-role := lower-case(substring-before($node/@Rule, '2CL'))
	return
	
	if ($node/@ClType = 'VerbElided') then
		local:disambiguate-ellipsis($node, $passed-role)
	else switch ($node/@Rule)
		case 'V2CL'
		case 'S2CL'
		case 'O2CL'
		case 'ADV2CL'
			return <wg>{
						attribute class {'cl'},
						attribute role {'aux'|| (if ($debugging-mode) then  '_aux-single-constituent-clause1' else ())}, (: Ryder: should this sometimes be the passed role?? :)
						local:attributes($node, 'class') ! (if (name(.) = 'class') then () else .),
						$node/element() ! local:node(., ((if ($debugging-mode) then 'err_' || $internal-role || '_test' else ())))
					}</wg>
		case 'VC2CL'
			return <wg>{
						attribute class {'cl'},
						local:attributes($node, 'class') ! (if (name(.) = 'class') then () else .),
						$node/element() ! local:node(., 'vc' || (if ($debugging-mode) then  'err_' || $internal-role || '_test' else ()))
					}</wg>
		case 'PP2CL'
			return 
				$node/element() ! local:node(., 'adv' || (if ($debugging-mode) then  '_pp2cl' else ()))	
		case 'Intj2CL'
		case 'Np2CL'
			return 
				if (
					$node/descendant::Node/@Case="Vocative"
					or $node/@ClType = 'Minor'
				) then
					<wg>{
						local:attributes($node, 'class') ! (if (name(.) = 'class') then () else .),
						$node/element() ! local:node(., 'aux' || (if ($debugging-mode) then  '__intj2cl or np2cl' else ()))
					}</wg>

				else if (
					local:contains-projecting-verb($node/preceding-sibling::Node)
					or substring(($node//Node[@Unicode])[1]/text(), 1, 1)
						= upper-case(substring(($node//Node[@Unicode])[1]/text(), 1, 1))
				) then
					$node/element() ! local:node(., 'o' || (if ($debugging-mode) then  '_in sg constituent clause function' else ()))
				else
					$node/element() ! local:node(., 'aux' || (if ($debugging-mode) then  '_aux-single-constituent-clause2' else ()))
				
		case 'O22CL'
			return 
				(: Ryder TODO: revisit and disambiguate these since they are tied to complex clause disambiguation. They may need to have the $passed-role in cases where a ClCl parent has a projecting verb and content (and this O22CL could be the content, for example. :)
				$node/element() ! local:node(., ())
		case 'P2CL'
		case 'Relp2CL'
			return 
				$node/element() ! local:node(., $passed-role)
		
		default
			return
			 	<error_unhandled_single_constituent_clause role="error_unhandled_single_constituent_clause" rule="{$node/@Rule}">{$node/element() ! local:node(.)}</error_unhandled_single_constituent_clause>
};

declare function local:process-complex-node($node, $passed-role)
{
	(:  
    Nodes that make it here 
    - (1) have @Rule, 
    - (2) are not atomic nodes, and
    - (3) have had their coordination processed already, so as to attach every conjunction with its scope
    
    Some of these nodes are groups.
    - Group
    Some of them need to subordinate the head node (e.g., preposition phrases)
    - TODO: Are there some rules where there is one wrapper but multiple wrapped nodes?
    Others need to subordinate only the non-heads (the modifiers).
    
    check for $headed-structure-rule or $group-rule or $wrapper-clause-rule :)
	
	(: WRAPPERS - subordinates siblings :)
	if ($node/@Rule = $wrapper-rule) then
		(:local:process-wrapper($node, $passed-role):)
		<wg>{
				local:attributes($node),
				(:attribute type {"wrapper-scope"},:)
				if ($passed-role = 'apposition') then
				    attribute junction {$passed-role}
				else if ($passed-role) then
					attribute role {$passed-role}
				else
					(),
				$node/element() ! local:node(.)
			}</wg>
	else
		(: GROUP STRUCTURE - coordinate siblings :)
		if ($node/@Rule = ($group-rules, $apposition-rule)) then
			local:keep-siblings-as-siblings($node, $passed-role)
		
		else
			if ($node/@Rule = $auxiliary-rules) then
				<wg>{
					local:attributes($node),
					attribute role {'aux' || (if ($debugging-mode) then  '_complex-node-aux' else ())},
					$node/element() ! local:node(.)
				}</wg>
			
			(: COMPLEX CLAUSE RULE - create child from non-head sibling
            TODO: disambiguate role in new parent clause (some siblings
            will be auxiliaries, many will be adverbial, any other options? )
            
            :)
			else if ($node/@Rule = ($modifier-structure-rule)) then
				(: Ryder: keep modifier with modified. Note that aramaic determiners follow their nominal :)
				<wg>{
						local:attributes($node),
						if ($passed-role = 'apposition') then
				            attribute junction {$passed-role}
				        else if ($passed-role) then
							attribute role {$passed-role}
						else
							(),
						(:
						if ($node//@Rule = $nominalized-clause-rule) then
							attribute type {'modifier-clause-scope'}
						else 
							attribute type {'modifier-scope'},
						:)
						$node/element() ! local:node(.)
					}</wg>
			else
				if ($node/@Rule = $wrapper-clause-rule) then
					local:process-wrapper-clause($node, $passed-role)
				else
						if ($node/@Rule = $complex-clause-rule) then
							local:disambiguate-clause-complex-structure($node, $passed-role)
						else
							if ($node/@Rule = $single-constituent-clause-rule) then
								local:process-single-constituent-clause($node, $passed-role)
						
						else
							<error_unknown_complex_node
								role="{'error_unknown_complex_node' || $node/@Rule}"
								rule="{$node/@Rule}">{$node/element() ! local:node(.)}</error_unknown_complex_node>
};

declare function local:phrase($node)
{
        <wg>
            {
                local:attributes($node),
                $node/Node ! local:node(.)
            }
        </wg>
};

(:declare function local:role($node)
{
    let $role := attribute role {lower-case($node/@Cat)}
    return
        if (count($node/Node) > 1)
        then
            <wg>
                {
                    $role,
                    $node/@nodeId ! local:nodeId2xmlId(.),
                    comment { "Role created from ", $node/@Rule },
                    $node/Node ! local:node(.)
                }
            </wg>
        else
            element {if ($node/Node/Node) then "wg" else "w"}
                {
                    let $child := local:node($node/Node)
                    return (
                        $role,
                        $child/@* except $child/@role,
                        comment { "Role created from ", $node/@Rule },
                        $child/node()
                    )
                }
};:)

declare function local:word($node)
{
    local:word($node, ())
};

declare function local:word($node, $passed-role)
(: $role can contain a role attribute or a null sequence :)
{
    let $wordContent := $node/text()
    let $wordContentWithoutBrackets := replace($node/text(), '([\(\)\[\]])', '') 
    let $normalizedFormWordLength := string-length($node/@NormalizedForm)
    let $normalizedFormWithPunctuationLength := $normalizedFormWordLength + 1
    return
        if ($node/*)
        then
            (element error {$passed-role, $node})
        else
            if (string-length($wordContentWithoutBrackets) = $normalizedFormWithPunctuationLength)
            then
                (: place punctuation in an 'after' attribute :)
                <w>
                    {
                        if ($passed-role = 'apposition') then
        				    attribute junction {$passed-role}
        				else if ($passed-role) then
							attribute role {$passed-role}
						else
							(),
                        attribute ref {local:USFMId($node/@nodeId)},
                        attribute after {substring($wordContentWithoutBrackets, string-length($wordContentWithoutBrackets), 1)},
                        local:attributes($node),
                        substring($wordContentWithoutBrackets, 1, string-length($wordContentWithoutBrackets) - 1)
                    }
                </w>
            else
                <w>
                    {
                        if ($passed-role = 'apposition') then
            				attribute junction {$passed-role}
            			else if ($passed-role) then
							attribute role {$passed-role}
						else
							(),
                        attribute ref {local:USFMId($node/@nodeId)},
                        attribute after {' '},
                        local:attributes($node),
                        string($wordContentWithoutBrackets)
                    }
                </w>
};

declare function local:node-type($node as element())
{
if (not($node/@Rule)) then
	'word'
else if ($node/@Rule = $conjuncted-structure-rule) then
	'conjunctions-to-be-processed'
else if (local:is-simple-clause-rule($node/@Rule)) then
	'simple-clause'
else if ($node/@Rule = $complex-clause-rule) then
	'clause-complex'
else if ($node/@Rule = $atomic-structure-rule) then
	'atomic'
else
	'complex' (: Ryder: note - if something had an erroneous rule it would end up being a 'complex' unit :)
};

(: Ryder: declare both 1-arg and 2-arg node-processing functions so the function can be called with or without the second argument. :)
declare function local:node($node as element()) {
	local:node($node, ())
};
declare function local:node($node as element(), $passed-role as xs:string?)
{
	(: Ryder: This function should only ever process exactly one element. If multiple are being passed, use the simple mapping operator (e.g., instead of local:node($node), use $node/element() ! local:node(.) :)
	if (count($node) gt 1) then
		<error_too_many_nodes
			role="{'error_too_many_nodes' || $node/@Rule}"
		>{$node}</error_too_many_nodes>
	else
		
		let $exceptions-to-skip-node := (
			'400250090140080', (: CLaCL to skip :)
			'400250110090020' (: ClCl with two auxiliaries :)
		)
		
		return
			if ($node/@nodeId = $exceptions-to-skip-node) then
					$node/element() ! local:node(., $passed-role || (if ($debugging-mode) then  '__exception-atomic_' || ./@Unicode else ()))
			else if ($node/@Rule = $conjuncted-structure-rule) then
				local:process-conjunctions($node, $passed-role)
			else 
				switch (local:node-type($node))
					case "word"
						return
							local:word($node, $passed-role)
					case "simple-clause"
						return
							local:simple-clause($node, $passed-role, ())
					case "clause-complex"
						return
							local:disambiguate-clause-complex-structure($node, $passed-role)
					case "atomic"
						return
							$node/element() ! local:node(., $passed-role || (if ($debugging-mode) then  '__atomic_' || ./@Unicode else ()))
					case "complex"
						return
							local:process-complex-node($node, $passed-role)
					default
					return
						<error_unknown_node_type
							role="{'error_unknown_node_type' || $node/@Rule}"
						>{$node/@*}</error_unknown_node_type>
};

declare function local:straight-text($node)
{
    for $n at $i in $node//Node[local:node-type(.) = 'word']
        order by $n/@morphId
    return
        string($n/@Unicode)
};

declare function local:sentence($node)
{
    <sentence>
        {
            <p>
                {
                    for $verse in distinct-values($node//Node/@nodeId ! local:USFMVerseId(.))
                    return
                        (
                        <milestone
                            unit="verse">
                            {attribute id {$verse}, $verse}
                        </milestone>
                        ,
                        " "
                        )
                }
                {local:straight-text($node)}
            </p>,
            
            if (count($node/Node) > 1 or not($node/Node/@node = 'CL'))
            then
                <wg>{$node/Node ! local:node(.)}</wg>
            else
                local:node($node/Node)
            
        }
    </sentence>
};

processing-instruction xml-stylesheet {'href="treedown.css"'},
processing-instruction xml-stylesheet {'href="boxwood.css"'},
<book lang="el">
    {
        attribute id {local:USFMBook((//Node)[1]/@nodeId)},
        (:
            If a sentence has multiple interpretations, Sentence/Trees may contain
            multiple Tree nodes.  We want only the first.
        :)
        for $sentence in //Tree[1]/Node
        return
            local:sentence($sentence)
    }
</book>
