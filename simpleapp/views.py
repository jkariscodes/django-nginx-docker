from django.shortcuts import render, HttpResponse


def test_page(request):
    return HttpResponse('<h2>Welcome to this Django project.</h2>')
