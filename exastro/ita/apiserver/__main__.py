from flask import Flask, Blueprint, request, abort, jsonify, make_response
from flask_cors import CORS, cross_origin

#api = Blueprint('api', __name__, url_prefix='/apiproto')
api = Flask(__name__)
#CORS(api, support_credentials=True)

@api.route('/apiproto', methods=['GET'])
@cross_origin(supports_credentials=True)
def get_top():
    result = {
        "result":200,
        "method":"GET",
        "data":{
                "page":"top page"
        }
    }

    return make_response(jsonify(result))

@api.route('/apiproto/mainmenu', methods=['GET'])
@cross_origin(supports_credentials=True)
def get_mainmenu():
    result = {
        "result":200,
        "method":"GET",
        "data":{
                "page":"mainmenu page"
        }
    }

    return make_response(jsonify(result))

@api.route('/apiproto/menu/<menu_id>', methods=['POST'])
#@cross_origin(supports_credentials=True)
def get_menu(menu_id):
    result = {
        "result":200,
        "method":"POST",
        "data":{
                "page":"menu page",
                "menu_id":menu_id
        }
    }

    return make_response(jsonify(result))



@api.errorhandler(404)
def not_found(error):
    return make_response(jsonify({'error': 'Not found'}), 404)

if __name__ == '__main__':
    api.run(host='0.0.0.0', port=80)