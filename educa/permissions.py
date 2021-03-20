from rest_framework import permissions
from rest_framework_simplejwt.authentication import JWTAuthentication
from rest_framework_simplejwt.exceptions import InvalidToken

class OnlyOwner(permissions.BasePermission):
    def has_permission(self, request, view):
        jwt_obj = JWTAuthentication()
        header = jwt_obj.get_header(request)
        if header is None:
            return False
        token = jwt_obj.get_raw_token(header)
        if token is None:
            return False
        validated_token = jwt_obj.get_validated_token(token)
        token_user_id = jwt_obj.get_user(validated_token)
        user_id = view.kwargs.get('pk', 0)
        return token_user_id.id == user_id

        