"""Module Docstring"""
from marshmallow import Schema, fields

class GithubRepoSchema(Schema):
    """Define Schema for github """
    id = fields.Int(required=True)
    repo_name = fields.Str()
    full_name = fields.Str()
    language = fields.Str()
    description = fields.Str()
    repo_url = fields.URL()

class KudoSchema(GithubRepoSchema):
    """Define Schema for kudos """
    user_id = fields.Email(required=True)
