--グランドレミコード・クーリア
--GranSolfachord Coolia
--Scripted by Hatter
local s,id=GetID()
function s.initial_effect(c)
	c:EnableReviveLimit()
	--2+ monsters, including a Pendulum Monster
	Link.AddProcedure(c,nil,2,3,s.lcheck)
	--Gains 100 ATK for each face-up Pendulum Monster in the Extra Deck
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetProperty(EFFECT_FLAG_SINGLE_RANGE)
	e1:SetCode(EFFECT_UPDATE_ATTACK)
	e1:SetRange(LOCATION_MZONE)
	e1:SetValue(s.atkval)
	c:RegisterEffect(e1)
	--Activated effects of Pendulum Monsters this card points to cannot be negated
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_FIELD)
	e2:SetCode(EFFECT_CANNOT_DISEFFECT)
	e2:SetRange(LOCATION_MZONE)
	e2:SetValue(s.effval)
	c:RegisterEffect(e2)
	--Special Summon 1 "Solfachord" card with an odd Pendulum Scale
	local e3=Effect.CreateEffect(c)
	e3:SetDescription(aux.Stringid(id,0))
	e3:SetCategory(CATEGORY_SPECIAL_SUMMON+CATEGORY_NEGATE+CATEGORY_TOEXTRA)
	e3:SetType(EFFECT_TYPE_QUICK_O)
	e3:SetCode(EVENT_CHAINING)
	e3:SetRange(LOCATION_MZONE)
	e3:SetCountLimit(1)
	e3:SetCondition(s.spcon)
	e3:SetTarget(s.sptg)
	e3:SetOperation(s.spop)
	c:RegisterEffect(e3)
end
s.listed_series={SET_SOLFACHORD}
function s.lcheck(g,lc,sumtype,tp)
	return g:IsExists(Card.IsType,1,nil,TYPE_PENDULUM,lc,sumtype,tp)
end
function s.atkval(e,c)
	return Duel.GetMatchingGroupCount(aux.FaceupFilter(Card.IsType,TYPE_PENDULUM),e:GetHandlerPlayer(),LOCATION_EXTRA,0,nil)*100
end
function s.effval(e,ct)
	local te=Duel.GetChainInfo(ct,CHAININFO_TRIGGERING_EFFECT)
	return te:IsActiveType(TYPE_PENDULUM) and e:GetHandler():GetLinkedGroup():IsContains(te:GetHandler())
end
function s.spcon(e,tp,eg,ep,ev,re,r,rp)
	return rp==1-tp and Duel.IsChainDisablable(ev)
end
function s.spfilter(c,e,tp,zone)
	return c:IsSetCard(SET_SOLFACHORD) and c:IsOddScale() 
		and c:IsCanBeSpecialSummoned(e,0,tp,false,false,POS_FACEUP,tp,zone)
end
function s.sptg(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then
		local zone=e:GetHandler():GetLinkedZone(tp)
		return Duel.GetLocationCount(tp,LOCATION_MZONE,tp,LOCATION_REASON_TOFIELD,zone)>0
			and Duel.IsExistingMatchingCard(s.spfilter,tp,LOCATION_PZONE,0,1,nil,e,tp,zone)
	end
	Duel.SetOperationInfo(0,CATEGORY_SPECIAL_SUMMON,nil,1,tp,LOCATION_PZONE)
	Duel.SetOperationInfo(0,CATEGORY_NEGATE,eg,1,0,0)
	Duel.SetPossibleOperationInfo(0,CATEGORY_TOEXTRA,nil,1,tp,LOCATION_DECK)
end
function s.tefilter(c)
	return c:IsSetCard(SET_SOLFACHORD) and c:IsType(TYPE_PENDULUM) and c:IsEvenScale() and not c:IsForbidden()
end
function s.spop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	if not c:IsRelateToEffect(e) then return end
	local zone=e:GetHandler():GetLinkedZone(tp)
	if Duel.GetLocationCount(tp,LOCATION_MZONE,tp,LOCATION_REASON_TOFIELD,zone)==0 then return end
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_SPSUMMON)
	local sg=Duel.SelectMatchingCard(tp,s.spfilter,tp,LOCATION_PZONE,0,1,1,nil,e,tp,zone)
	if #sg==0 or Duel.SpecialSummon(sg,0,tp,tp,false,false,POS_FACEUP,zone)==0 or not Duel.NegateActivation(ev) then return end
	if re:IsHasType(EFFECT_TYPE_ACTIVATE) and re:GetHandler():IsRelateToEffect(re) then
		Duel.SendtoGrave(eg,REASON_EFFECT)
	end
	local g=Duel.GetMatchingGroup(s.tefilter,tp,LOCATION_DECK,0,nil)
	if #g==0 or not Duel.SelectYesNo(tp,aux.Stringid(id,1)) then return end
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_SELECT)
	local pg=g:Select(tp,1,1,nil)
	if #pg>0 then
		Duel.BreakEffect()
		Duel.SendtoExtraP(pg,tp,REASON_EFFECT)
	end
end