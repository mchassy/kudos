"""Module Docstring"""
from ..repository import Repository
from ..repository.mongo import MongoRepository
from .schema import KudoSchema

class Service():
    """Service Objects"""
    def __init__(self, user_id, repo_client=Repository(adapter=MongoRepository)):
        """Mark Method"""
        self.repo_client = repo_client
        self.user_id = user_id

        if not user_id:
            raise Exception("user id not provided")

    def find_all_kudos(self):
        """Search all method"""
        kudos = self.repo_client.find_all({'user_id': self.user_id})
        return [self.dump(kudo) for kudo in kudos]

    def find_kudo(self, repo_id):
        """Search one method"""
        kudo = self.repo_client.find({'user_id': self.user_id, 'repo_id': repo_id})
        return self.dump(kudo)

    def create_kudo_for(self, github_repo):
        """Create method"""
        self.repo_client.create(self.prepare_kudo(github_repo))
        return self.dump(github_repo.data)

    def update_kudo_with(self, repo_id, github_repo):
        """Update Method"""
        records_affected = self.repo_client.update({'user_id': self.user_id, 'repo_id': repo_id},
                                                   self.prepare_kudo(github_repo))
        return records_affected > 0

    def delete_kudo_for(self, repo_id):
        """Delete Method"""
        records_affected = self.repo_client.delete({'user_id': self.user_id, 'repo_id': repo_id})
        return records_affected > 0

    @classmethod
    def dump(cls, data=None):
        """Dump Method"""
        return KudoSchema(exclude=['_id']).dump(data).data

    def prepare_kudo(self, github_repo):
        """Prep Method"""
        data = github_repo.data
        data['user_id'] = self.user_id
        return data
