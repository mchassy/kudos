"""Used to test pylint. Put it in comment in order to trigger a convention violation."""
import os
from pymongo import MongoClient

COLLECTION_NAME = 'kudos'

class MongoRepository():
    """Used to test pylint. Put it in comment in order to trigger a convention violation."""
    def __init__(self):
        """Used to test pylint. Put it in comment in order to trigger a convention violation."""
        mongo_url = os.environ.get('MONGO_URL')
        self.data_base = MongoClient(mongo_url).kudos

    def find_all(self, selector):
        """Used to test pylint. Put it in comment in order to trigger a convention violation."""
        return self.data_base.kudos.find(selector)

    def find(self, selector):
        """Used to test pylint. Put it in comment in order to trigger a convention violation."""
        return self.data_base.kudos.find_one(selector)

    def create(self, kudo):
        """Used to test pylint. Put it in comment in order to trigger a convention violation."""
        return self.data_base.kudos.insert_one(kudo)

    def update(self, selector, kudo):
        """Used to test pylint. Put it in comment in order to trigger a convention violation."""
        return self.data_base.kudos.replace_one(selector, kudo).modified_count

    def delete(self, selector):
        """Used to test pylint. Put it in comment in order to trigger a convention violation."""
        return self.data_base.kudos.delete_one(selector).deleted_count
