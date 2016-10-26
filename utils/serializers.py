from rest_framework import serializers
from utils.models import District, State, Country


class DistrictSerializer(serializers.Serializer):
	state = serializers.CharField(required=True,max_length=100)
	district = serializers.CharField(required=True, max_length=100)
	abrcode = serializers.CharField(required=False, max_length=100)
	url = serializers.URLField(required=False, max_length=100)
	vcount = serializers.IntegerField(default=0)
	code = serializers.CharField(required=False, max_length=10)
	hq = serializers.CharField(required=False, max_length=100)
	population = serializers.IntegerField(default=0)
	area = serializers.IntegerField(default=0)
	density = serializers.IntegerField(default=0)

	def create(self, validated_data):
		return District.objects.create(**validated_data)

	def update(self, instance, validated_data):
		instance.state = validated_data.get('state', instance.district.state)
		instance.district = validated_data.get('district', instance.district)
		instance.district = validated_data.get('abrcode', instance.abrcode)
		instance.save()
		return instance
