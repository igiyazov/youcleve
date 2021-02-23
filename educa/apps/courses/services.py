
def get_filtered(request,model):
    courses_filter = request.GET.get('filter', None)
    courses_level = request.GET.get('level', None)
    
    if courses_filter and courses_filter == 'recommended':
        model = model.recommended()
    elif courses_filter and courses_filter == 'popular':
        model = model.popular()
    elif courses_filter and courses_filter == 'duration':
        model = model.duration()

    if courses_level and courses_level == 'CH':
        model = model.for_children()
    elif courses_level and courses_level == 'BG':
        model = model.for_begginer()
    elif courses_level and courses_level == 'AD':
        model = model.for_advanced()
    return model
        