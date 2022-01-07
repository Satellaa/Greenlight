-- スケアクロー・ベロネア
-- Scareclaw Veronea
-- Scripted by Hatter
local s,id=GetID()
function s.initial_effect(c)
	-- Special Summon procedure
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_FIELD)
	e1:SetCode(EFFECT_SPSUMMON_PROC)
	e1:SetProperty(EFFECT_FLAG_UNCOPYABLE)
	e1:SetRange(LOCATION_HAND)
	e1:SetCountLimit(1,id,EFFECT_COUNT_CODE_OATH)
	e1:SetCondition(s.hspcon)
	e1:SetValue(s.hspval)
	c:RegisterEffect(e1)
	-- Piercing damage
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_FIELD)
	e2:SetCode(EFFECT_PIERCE)
	e2:SetRange(LOCATION_MZONE)
	e2:SetTargetRange(LOCATION_MZONE,0)
	e2:SetTarget(s.damtg)
	c:RegisterEffect(e2)
end
s.listed_series={0x279}
s.sclawfilter=aux.FilterFaceupFunction(Card.IsSetCard,0x279)
function s.sclawzones(tp)
	local zone=0
	local lg=Duel.GetMatchingGroup(s.sclawfilter,tp,LOCATION_MZONE,0,nil)
	for tc in aux.Next(lg) do
		zone=(zone|tc:GetColumnZone(LOCATION_MZONE,1,1,tp))
	end
	return zone&0x1f
end
function s.hspcon(e,c)
	if not c then return true end
	local tp=c:GetControler()
	return Duel.GetLocationCount(tp,LOCATION_MZONE,tp,LOCATION_REASON_TOFIELD,s.sclawzones(tp))>0
end
function s.hspval(e,c)
	return 0,s.sclawzones(c:GetControler())
end
function s.damtg(e,c)
	return s.sclawfilter(c) and c:IsInExtraMZone()
end